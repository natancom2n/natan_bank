defmodule NatanBank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NatanBankWeb.Telemetry,
      # Start the Ecto repository
      NatanBank.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NatanBank.PubSub},
      # Start the Endpoint (http/https)
      NatanBankWeb.Endpoint
      # Start a worker by calling: NatanBank.Worker.start_link(arg)
      # {NatanBank.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NatanBank.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NatanBankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
