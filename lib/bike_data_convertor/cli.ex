defmodule BikeDataConvertor.CLI do
  use Bakeware.Script

  require Logger

  @impl Bakeware.Script
  def main(args) do
    Application.ensure_all_started(:logger)
    result = BikeDataConvertor.Fit2Gpx.CLI.run(args)
    Logger.flush()
    result
  end
end
