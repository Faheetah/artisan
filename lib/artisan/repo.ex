defmodule Artisan.Repo do
  use Ecto.Repo,
    otp_app: :artisan,
    adapter: Ecto.Adapters.Postgres
end
