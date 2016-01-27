defmodule Elixirfib.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    [worker(Elixirfib.Server, [[name: :fib_server]])]
    |> supervise(strategy: :one_for_one)
  end
end
