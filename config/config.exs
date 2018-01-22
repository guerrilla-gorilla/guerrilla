# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :guerrilla,
  ecto_repos: [Guerrilla.Repo]

# Configures the endpoint
config :guerrilla, GuerrillaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mzWls4Gl9SHxr7+Q25Zwsw45e7K0l2aqGRciO6QIZox29L6OBLelDrdwEIcKfq1M",
  render_errors: [view: GuerrillaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Guerrilla.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
