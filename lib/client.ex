defmodule Elixirfib.Client do
  def fib(n) do
    send :global.whereis_name(:fib_server), {self(), n}
    receive do
      {:result, n} ->
        IO.puts n
    end
  end
end
