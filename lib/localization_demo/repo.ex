defmodule LocalizationDemo.Repo do
  use Ecto.Repo,
    otp_app: :localization_demo,
    adapter: Ecto.Adapters.Postgres
end
