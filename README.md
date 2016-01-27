# Elixirfib
Fibonacci server

## Become leader

```bash
iex --sname server -S mix
iex(server@local)> Elixirfib.Server.become_leader
```

## Query server as the client

```bash
iex --sname client-one -S mix
iex(client-one@local)> Node.connect(:"server@local")
iex(client-one@local)> alias Elixirfib.Server
iex(client-one@local)> Server.fib(Server.leader_pid, 10) # 55
```

## Installation
If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:
- Add elixirfib to your list of dependencies in `mix.exs`:

     def deps do

  ```
   [{:elixirfib, "~> 0.0.1"}]
  ```

     end

- Ensure elixirfib is started before your application:

     def application do

  ```
   [applications: [:elixirfib]]
  ```

     end
