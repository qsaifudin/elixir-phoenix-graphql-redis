defmodule PhoenixGraphqlRedis.Redis do
  use GenServer

  @redis_url Application.compile_env(:project_phoenix, :redis_url, "redis://localhost:6379")

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, conn} = Redix.start_link(@redis_url)
    {:ok, conn}
  end

  def set(key, value) do
    GenServer.call(__MODULE__, {:set, key, value})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def handle_call({:set, key, value}, _from, conn) do
    {:ok, _} = Redix.command(conn, ["SET", key, value])
    {:reply, :ok, conn}
  end

  def handle_call({:get, key}, _from, conn) do
    {:ok, value} = Redix.command(conn, ["GET", key])
    {:reply, value, conn}
  end
end
