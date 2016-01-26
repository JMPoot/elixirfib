defmodule Elixirfib.Server do
  @name :fib_server

  def start do
    pid = spawn(__MODULE__, :fib, [])
    :global.register_name(@name, pid)
  end

  def fib do
    receive do
      {client_pid, n} ->
        send client_pid, {:result, Elixirfib.fib(n)}
        fib
    end
  end
end
