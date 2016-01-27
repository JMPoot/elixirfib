defmodule Elixirfib do
  use Application

  @doc ~S"""
  Start the Elixirfib application tree
  """
  def start(:normal, args) do
    {:ok, pid} = Elixirfib.Supervisor.start_link()
    {:ok, pid}
  end
end
