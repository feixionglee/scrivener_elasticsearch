defmodule ScrivenerElasticsearch.Mixfile do
  use Mix.Project

  def project do
    [app: :scrivener_elasticsearch,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Paginate your tirexs elasticsearch results with Scrivener",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:scrivener, "~> 2.0"},
     {:tirexs, "~> 0.8"}]
  end

  defp package do
    [
      maintainers: ["FeiXiong Lee"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/feixionglee/scrivener_elasticsearch"}
    ]
  end
end
