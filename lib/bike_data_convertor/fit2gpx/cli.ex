defmodule BikeDataConvertor.Fit2Gpx.CLI do
  @moduledoc """
  Coverts .fit files to .gpx
  """

  require Logger

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
        Logger.error(message)
        1
    end
  end

  defp convert(options) do
    Logger.debug("converting '#{options.source}' to '#{options.destination}'")
    {:ok, data} = File.read(options.source)
    {:ok, fit} = Fit.from_binary(data)
    {:ok} = Fit.Gpx.save(fit, options.destination)
  end
end
