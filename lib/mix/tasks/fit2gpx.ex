defmodule Mix.Tasks.BikeDataConvertor.Fit2Gpx do
  @moduledoc """
  Convert Jepster .fit files to .gpx
  """

  use Mix.Task

  @shortdoc "Converts .fit files to .gpx"
  def run(args) do
    {:ok} = BikeDataConvertor.Fit2Gpx.CLI.run(args)
  end
end
