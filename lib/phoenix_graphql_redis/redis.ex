defmodule PhoenixGraphqlRedis.Redis do
  use GenServer

  # Define the Redis URL from the application environment or default to localhost
  @redis_url Application.compile_env(:project_phoenix, :redis_url, "redis://localhost:6379")


  # Starts the GenServer
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  # Initializes the GenServer and starts a connection to Redis
  def init(_) do
    {:ok, conn} = Redix.start_link(@redis_url)
    {:ok, conn}
  end

  # Public API to set a key-value pair in Redis
  def set(key, value) do
    GenServer.call(__MODULE__, {:set, key, value})
  end

  # Public API to get a value by key from Redis
  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  # Handles the set request, sending the command to Redis
  def handle_call({:set, key, value}, _from, conn) do
    {:ok, _} = Redix.command(conn, ["SET", key, value])
    {:reply, :ok, conn}
  end

  # Handles the get request, sending the command to Redis
  def handle_call({:get, key}, _from, conn) do
    {:ok, value} = Redix.command(conn, ["GET", key])
    {:reply, value, conn}
  end
end
