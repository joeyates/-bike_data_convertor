defmodule BikeDataConvertor.Fit2Gpx.CLI do
  @moduledoc """
  Coverts .fit files to .gpx
  """

  defstruct ~w(destination dry_run quiet source verbose)a

  @switches [
    destination: :string,
    dry_run: :boolean,
    quiet: :boolean,
    source: :string,
    verbose: :count
  ]

  @required [:source, :destination]

  @callback run([String.t()]) :: {:ok}
  def run(args) do
    case BikeDataConvertor.OptionParser.run(
          args,
          switches: @switches,
          required: @required,
          struct: __MODULE__
        ) do
      {:ok, options, []} ->
        convert(options)
        0
      {:error, message} ->
        IO.puts "Error: #{message}"
        1
    end
  end

  defp convert(options) do
    {:ok, data} = File.read(options.source)
    {:ok, fit} = Fit.from_binary(data)
    {:ok} = Fit.Gpx.save(fit, options.destination)
  end
end
