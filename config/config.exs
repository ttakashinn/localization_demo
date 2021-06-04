# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :localization_demo,
  ecto_repos: [LocalizationDemo.Repo]

# Configures the endpoint
config :localization_demo, LocalizationDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jwy1/LZOxayfuufDtRobfzOv494BKBuLbJAxls1a2bl1WqIcqW3LhgjBFLVr+xfw",
  render_errors: [view: LocalizationDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LocalizationDemo.PubSub,
  live_view: [signing_salt: "9dsK9SeO"]

config :localization_demo, LocalizationDemoWeb.Gettext, default_locale: "vi"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
