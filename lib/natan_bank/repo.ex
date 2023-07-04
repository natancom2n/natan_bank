defmodule NatanBank.Repo do
  use Ecto.Repo,
    otp_app: :natan_bank,
    adapter: Ecto.Adapters.Postgres
end
