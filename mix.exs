defmodule GithubWebhookAuthenticationPlug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :github_webhook_authentication_plug,
      version: "0.0.3",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
    ]
  end

  def application do
    [
      applications: [:plug, :logger],
    ]
  end

  defp deps do
    [
      {:plug, "~>1.1"},
    ]
  end

  defp description do
    """
    This Plug makes it easy to authenticate Github webhook requests
    in your Elixir apps.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Robin Daugherty", "Emil Soman"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/RobinDaugherty/github_webhook_authentication_plug"},
    ]
  end
end
