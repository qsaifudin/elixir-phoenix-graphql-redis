defmodule PhoenixGraphqlRedis.RedisTest do
  use ExUnit.Case
  alias PhoenixGraphqlRedis.Redis

  test "set and get value" do
    assert :ok == Redis.set("my_key_test_redis", "my_value_test_redis")
    assert "my_value_test_redis" == Redis.get("my_key_test_redis")
  end
end
