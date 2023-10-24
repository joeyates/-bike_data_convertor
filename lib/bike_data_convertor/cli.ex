defmodule BikeDataConvertor.CLI do
  use Bakeware.Script

  @impl Bakeware.Script
  def main(args) do
    BikeDataConvertor.Fit2Gpx.CLI.run(args)
  end
end
