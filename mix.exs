defmodule BikeDataConvertor.MixProject do
  use Mix.Project

  @app :bike_data_convertor

  def project do
    [
      app: @app,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}],
      preferred_cli_env: [
        release: :prod
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    build_cli = System.get_env("BUILD_BAKEWARE")
    if build_cli do
      [{:mod, {BikeDataConvertor.CLI, []}}]
    else
      []
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bakeware, ">= 0.0.0", runtime: false}
    ]
  end

  defp release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      quiet: true,
      steps: [:assemble, &Bakeware.assemble/1],
      strip_beams: Mix.env() == :prod
    ]
  end
end
