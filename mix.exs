defmodule ExImaginary.MixProject do
  use Mix.Project

  @github_url "https://github.com/mrdotb/ex_imaginary"
  @version "0.1.0"

  defp package do
    [
      description: "An Elixir client library for generating image URLs with imaginary",
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["mrdotb"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @github_url
      }
    ]
  end

  def project do
    [
      app: :ex_imaginary,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @github_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
