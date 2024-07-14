# Phoenix GraphQL Redis Project

## Author
- Saifudin
- Email: qsaifudin.official@gmail.com
- LinkedIn: https://www.linkedin.com/in/qsaifudin/
- Personal Web: https://qsaifudin.site/

## Project Resources
- GitHub Repo : https://github.com/qsaifudin/elixir-phoenix-graphql-redis.git
- Video Demo : https://youtu.be/9bj3IHzTvnY

## Overview
This project implements a server application in Elixir using the Phoenix framework to create a GraphQL API integrated with Redis for key/value storage.

## Design System
<img src="design system.jpg" alt="Design System" width="100%"/>
In the project, GraphQL API can be accessed via tools like Postman and also provides an interactive GraphQL execution environment through a web browser. And this project is built using the following requirement:

### Requirement
- Phoenix Framework: Ensures robustness and scalability in web development with Elixir.
- Absinthe: Facilitates GraphQL implementation seamlessly integrated with Phoenix.
- Redis with Redix: Provides fast key-value storage and efficient data caching capabilities.


## How to Run the Project
1. Clone the Repository:
    ```bash
    git clone https://github.com/qsaifudin/elixir-phoenix-graphql-redis.git
    cd elixir-phoenix-graphql-redis
    ```

2. Install and setup dependencies:
    ```bash
    mix setup
    ```

3. Start Redis Server, ensure Redis is running locally 
    ```bash
    redis-server
    ```

4. Start the Phoenix Server:
    ```bash
    mix phx.server
    ```

5. Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Testing Strategy GraphQL

### Unit Tests

- Redis Tests: Validate Redis interaction logic.


  File location
  ``` bash
  elixir-phoenix-graphql-redis/test/phoenix_graphql_redis/redis_test.exs
  ```
- Schema Tests: Mock Redis interactions and validate resolver logic.

  File location
  ``` bash
  elixir-phoenix-graphql-redis/test/phoenix_graphql_redis_web/controllers/schema_test.exs
  ```


- Run All Unit Tests:
  ```bash
  mix test
  ```

### Integration Tests

End-to-End Tests: Verify full functionality of GraphQL queries and mutations with a live Redis instance.

#### 1. Test GraphiQL via Browser
Open [`http://localhost:4000/api/graphi-ql`](http://localhost:4000/api/graphi-ql) in your browser.

- Mutation:
  ```graphql
  mutation {
    setValue(key: "key_name", value: "value_name")
  }
  ```

- Query:
  ```graphql
  query {
    getValue(key: "key_name")
  }
  ```

#### 2.Test GraphQL via API Directly
Send GraphQL queries and mutations programmatically to `http://localhost:4000/api/graphql`.

- Mutation:
  ```graphql
  {"query": "mutation { setValue(key: \"key_name\", value: \"value_name\") }"}
  ```

- Query:
  ```graphql
  {"query": "query { getValue(key: \"tonight\") }"}
  ```

## Issues Encountered
- Redis Connection Errors: Managed through retries and ensuring Redis server availability.
