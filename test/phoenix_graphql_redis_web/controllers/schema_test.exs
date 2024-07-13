defmodule PhoenixGraphqlRedisWeb.SchemaTest do
  use PhoenixGraphqlRedisWeb.ConnCase, async: true

  @set_value_mutation """
  mutation SetValue($key: String!, $value: String!) {
    setValue(key: $key, value: $value)
  }
  """

  @get_value_query """
  query GetValue($key: String!) {
    getValue(key: $key)
  }
  """

  test "set and get value via GraphQL", %{conn: conn} do
    # Set value
    variables = %{"key" => "my_key_test_schema", "value" => "my_value_test_schema"}
    conn = post conn, "/api/graphql", %{query: @set_value_mutation, variables: variables}
    assert json_response(conn, 200)["data"]["setValue"] == "my_value_test_schema"

    # Retrieve value
    variables = %{"key" => "my_key_test_schema"}
    conn = post conn, "/api/graphql", %{query: @get_value_query, variables: variables}
    assert json_response(conn, 200)["data"]["getValue"] == "my_value_test_schema"
  end
end
