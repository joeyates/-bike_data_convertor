defmodule BikeDataConvertor.MixProject do
  use Mix.Project

  def project do
    [
      app: :bike_data_convertor,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bakeware, ">= 0.0.0", runtime: false}
    ]
  end
end
