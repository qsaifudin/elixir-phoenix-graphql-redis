defmodule PhoenixGraphqlRedis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixGraphqlRedisWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phoenix_graphql_redis, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixGraphqlRedis.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixGraphqlRedis.Finch},
      # Start a worker by calling: PhoenixGraphqlRedis.Worker.start_link(arg)
      # {PhoenixGraphqlRedis.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixGraphqlRedisWeb.Endpoint,
      # Start the Redis connection
      PhoenixGraphqlRedis.Redis
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixGraphqlRedis.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixGraphqlRedisWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
