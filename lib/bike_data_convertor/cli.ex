defmodule BikeDataConvertor.CLI do
  use Bakeware.Script

  @impl Bakeware.Script
  def main(args) do
    Application.ensure_all_started(:logger)
    BikeDataConvertor.Fit2Gpx.CLI.run(args)
  end
end
