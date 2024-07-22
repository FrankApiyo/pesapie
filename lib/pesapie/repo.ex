defmodule Pesapie.Repo do
  use Ecto.Repo,
    otp_app: :pesapie,
    adapter: Ecto.Adapters.Postgres
end
