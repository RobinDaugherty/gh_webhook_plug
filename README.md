# GithubWebhookAuthenticationPlug

Plug that handles authentication of Github Webhook requests.
Makes it easy to listen to Github webhook requests in your Elixir apps and ensure
that the requests are authentic.

Features:

* Verifies authenticity using webhook secret

## Installation

  1. Add github_webhook_authentication_plug to your list of dependencies in `mix.exs`:

        def deps do
          [{:github_webhook_authentication_plug, "~> 1.0"}]
        end

  2. Ensure github_webhook_authentication_plug is started before your application:

        def application do
          [applications: [:github_webhook_authentication_plug]]
        end

## Usage

```elixir
defmodule DemoPlugApp do
  use Plug.Builder

  # Use GithubWebhookAuthenticationPlug and pass it 3 things:
  # 1. secret : the secret you configured when you set up the Github webhook
  # 2. path : The HTTP endpoint which should listen for webhook requests
  # 3. action: Tuple containing the module and function which should handle the webhook payload
  plug GithubWebhookAuthenticationPlug, secret: "secret", path: "/gh-webhook", action: {__MODULE__, :gh_webhook}

  # You can add other plugs as you normally would.
  # The connection reaches this plug if the webhook's path is not matched above.
  plug :next_in_chain

  def gh_webhook(payload) do
    # Do something with payload
  end
end
```

## TODO

* Add polymorphic handlers for different types of GH events which are overridable by user.

## License

MIT
