defmodule MessagingApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MessagingApp.Repo,
      # Start the Telemetry supervisor
      MessagingAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MessagingApp.PubSub},
      # Start the Endpoint (http/https)
      MessagingAppWeb.Endpoint
      # Start a worker by calling: MessagingApp.Worker.start_link(arg)
      # {MessagingApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MessagingApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MessagingAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
