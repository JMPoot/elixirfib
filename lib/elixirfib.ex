defmodule Elixirfib do
  use Application

  @doc ~S"""
  Start the Elixirfib application tree
  """
  def start(:normal, _args) do
    Elixirfib.Supervisor.start_link()
  end
end
