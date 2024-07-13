defmodule PhoenixGraphqlRedisWeb.Schema do
  use Absinthe.Schema

  alias PhoenixGraphqlRedisWeb.Resolvers.KeyValue

  query do
    field :get_value, :string do
      arg :key, non_null(:string)
      resolve &KeyValue.get/3
    end
  end

  mutation do
    field :set_value, :string do
      arg :key, non_null(:string)
      arg :value, non_null(:string)
      resolve &KeyValue.set/3
    end
  end
end
