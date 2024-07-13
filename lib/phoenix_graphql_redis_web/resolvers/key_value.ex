defmodule PhoenixGraphqlRedisWeb.Resolvers.KeyValue do
  alias PhoenixGraphqlRedis.Redis

  def get(_parent, %{key: key}, _resolution) do
    value = Redis.get(key)
    {:ok, value}
  end

  def set(_parent, %{key: key, value: value}, _resolution) do
    Redis.set(key, value)
    {:ok, value}
  end
end
