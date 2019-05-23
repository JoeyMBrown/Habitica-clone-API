defmodule HabiticaBackend.Repo do
  use Ecto.Repo,
    otp_app: :habitica_backend,
    adapter: Ecto.Adapters.Postgres
end
