defmodule PhoenixGraphqlRedisWeb.Resolvers.KeyValue do
  alias PhoenixGraphqlRedis.Redis

  # Fetches a value associated with the given key from Redis.
  def get(_parent, %{key: key}, _resolution) do
    value = Redis.get(key)
    {:ok, value}
  end

  # Sets a value for the given key in Redis.
  def set(_parent, %{key: key, value: value}, _resolution) do
    Redis.set(key, value)
    {:ok, value}
  end
end
