# GithubWebhookAuthenticationPlug

Plug that handles authentication of Github Webhook requests.
Makes it easy to listen to Github webhook requests in your Elixir apps and ensure
that the requests are authentic.

Features:

* Verifies authenticity using webhook secret

## Installation

Add github_webhook_authentication_plug to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:github_webhook_authentication_plug, "~> 1.0"},
  ]
end
```

(For Elixir before 1.4) ensure github_webhook_authentication_plug is started before your application:

```elixir
def application do
  [applications: [:github_webhook_authentication_plug]]
end
```

## Usage

```elixir
defmodule DemoPlugApp do
  use Plug.Builder

  # Use GithubWebhookAuthenticationPlug and pass it 3 things:
  # 1. secret : the secret you configured when you set up the Github webhook
  # 2. path : The HTTP endpoint which should listen for webhook requests
  # 3. action: Tuple containing the module and function which should handle the webhook payload
  plug GithubWebhookAuthenticationPlug, secret: "secret"

  # You can add other plugs as you normally would.
  # The connection reaches this plug if the webhook's path is not matched above.
  plug :next_in_chain
end
```

## TODO

* Fix tests
* Provide instructions on how to configure the secret correctly.

## License

MIT
