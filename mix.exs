defmodule Devenvset.Mixfile do
  use Mix.Project

  def project do
    [app: :devenvset,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:coach, git: "git@github.com:cjpoll/coach", ref: "master"},
     {:dialyxir, "~> 0.5.0"}]
  end
end
