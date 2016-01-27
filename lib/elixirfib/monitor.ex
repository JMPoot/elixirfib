defmodule Elixirfib.Monitor do
  alias Elixirfib.Server

  def start_link do
    {:ok, spawn_link fn ->
      :global_group.monitor_nodes(true)
      monitor
    end}
  end

  def monitor do
    receive do
      {:nodeup, node} ->
        IO.puts "Monitor: #{node} joined"
      {:nodedown, node} ->
        IO.puts "Monitor: #{node} left"
        unless Server.has_leader? do
          IO.puts "Monitor: The leader left"
        end
    end
    monitor
  end
end
