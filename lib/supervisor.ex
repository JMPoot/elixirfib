defmodule Elixirfib.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    name = Application.get_env(:elixirfib, :server_name)
    [worker(Elixirfib.Server, [[name: {:global, name}]])]
    |> supervise(strategy: :one_for_one)
  end
end
