defmodule MessagingApp.Repo do
  use Ecto.Repo,
    otp_app: :messaging_app,
    adapter: Ecto.Adapters.Postgres
end
