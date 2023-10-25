defmodule BikeDataConvertor.OptionParser do
  @moduledoc """
  A command-line option parser
  """

  require Logger

  @doc ~S"""
  Parses command arguments, returns an error if
  required arguments are not supplied and sets the logging level

    iex> BikeDataConvertor.OptionParser.run(["--foo", "hi"], switches: [foo: :string])
    {:ok, %{foo: "hi"}, []}

    iex> BikeDataConvertor.OptionParser.run(["-f", "hi"], switches: [foo: :string], aliases: [f: :foo])
    {:ok, %{foo: "hi"}, []}

    iex> BikeDataConvertor.OptionParser.run(["--bar", "hi"], switches: [foo: :string])
    {:error, "Unexpected parameters supplied: [\"--bar\"]"}

    iex> BikeDataConvertor.OptionParser.run(["non-switch"], remaining: 1)
    {:ok, %{}, ["non-switch"]}

    iex> BikeDataConvertor.OptionParser.run(["pizza"])
    {:error, "You supplied unexpected non-switch arguments [\"pizza\"]"}

    iex> BikeDataConvertor.OptionParser.run(["first", "second"], remaining: 2..3)
    {:ok, %{}, ["first", "second"]}

    iex> BikeDataConvertor.OptionParser.run(["first"], remaining: 2)
    {:error, "Supply 2 non-switch arguments"}

    iex> BikeDataConvertor.OptionParser.run(["first"], remaining: 2..3)
    {:error, "Supply 2..3 non-switch arguments"}
  """
  def run(args, options \\ []) do
    with {:ok, opts} <- options_map(options),
         {:ok, named, remaining} <- parse(args, opts),
         {:ok} <- check_required(named, opts),
         {:ok} <- check_remaining(remaining, opts),
         {:ok} <- setup_logger(named),
         {:ok, named} <- optionally_build_struct(named, opts) do
      {:ok, named, remaining}
    else
      {:error, message} ->
        {:error, message}
    end
  end

  defp options_map(options), do: {:ok, Enum.into(options, %{})}

  defp parse(args, opts) do
    aliases = opts[:aliases] || []
    switches = opts[:switches] || []

    case OptionParser.parse(args, aliases: aliases, strict: switches) do
      {named_list, remaining, []} ->
        named = Enum.into(named_list, %{})
        {:ok, named, remaining}
      {_, _, invalid} ->
        keys = Enum.map(invalid, fn {key, _value} -> key end)
        {:error, "Unexpected parameters supplied: #{inspect(keys)}"}
    end
  end

  defp check_required(named, opts) do
    required = opts[:required] || []

    missing = Enum.filter(required, &(!Map.has_key?(named, &1)))
    if length(missing) == 0 do
      {:ok}
    else
      {:error, "Please supply the following parameters: #{inspect(missing)}"}
    end
  end

  defp check_remaining(remaining, %{remaining: %Range{} = range}) do
    if length(remaining) in range do
      {:ok}
    else
      {:error, "Supply #{inspect(range)} non-switch arguments"}
    end
  end
  defp check_remaining(remaining, %{remaining: count})
  when length(remaining) == count, do: {:ok}
  defp check_remaining(_remaining, %{remaining: count}) do
    {:error, "Supply #{count} non-switch arguments"}
  end
  defp check_remaining([], _options), do: {:ok}
  defp check_remaining(remaining, _opts) do
    {:error, "You supplied unexpected non-switch arguments #{inspect(remaining)}"}
  end

  defp optionally_build_struct(named, %{struct: module}) do
    {:ok, struct!(module, named)}
  end
  defp optionally_build_struct(named, _opts), do: {:ok, named}

  defp setup_logger(named) do
    verbose = Map.get(named, :verbose, 0)
    quiet = Map.get(named, :quiet, false)

    numeric_level = if quiet do
      0
    else
      1 + verbose
    end

    level =
      case numeric_level do
        0 -> :none
        1 -> :info
        _ -> :debug
      end
    Logger.configure([level: level])

    {:ok}
  end
end
