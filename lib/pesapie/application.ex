defmodule Pesapie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PesapieWeb.Telemetry,
      Pesapie.Repo,
      {DNSCluster, query: Application.get_env(:pesapie, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pesapie.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Pesapie.Finch},
      # Start a worker by calling: Pesapie.Worker.start_link(arg)
      # {Pesapie.Worker, arg},
      # Start to serve requests, typically the last entry
      PesapieWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pesapie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PesapieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
