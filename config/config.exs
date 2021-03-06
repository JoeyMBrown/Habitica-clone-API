# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :habitica_backend,
  ecto_repos: [HabiticaBackend.Repo]

# Configures the endpoint
config :habitica_backend, HabiticaBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J5Dr6fa6jt7m6BePb+OWHQNUDm4tUKhrza7VaKhjyhRCI5zLBsca+g4f61KYtcP+",
  render_errors: [view: HabiticaBackendWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: HabiticaBackend.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :habitica_backend, HabiticaBackend.Auth.Guardian,
       issuer: "habitica_backend",
       secret_key: "TuUDS4C+fvrF/qHE5XzGVDD5J2+Za/UpLlQNXRmZ3xxKUY+Qf+w02jU2PkRrU+LQ"

