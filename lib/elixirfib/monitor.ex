defmodule Elixirfib.Monitor do
  def start_link do
    {:ok, spawn_link fn ->
      :global_group.monitor_nodes(true)
      monitor
    end}
  end

  def monitor do
    receive do
      {:nodeup, node}   -> IO.puts "Monitor: #{node} joined"
      {:nodedown, node} -> IO.puts "Monitor: #{node} left"
    end
    monitor
  end
end
