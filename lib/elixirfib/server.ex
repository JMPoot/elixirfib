defmodule Elixirfib.Server do
  use GenServer

  # Client
  def become_leader do
    start_link([name: {:global, name}])
  end

  def leader_pid do
    :global.whereis_name(name)
  end

  defp name, do: Application.get_env(:elixirfib, :server_name)

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def fib(server, n) do
    GenServer.call(server, {:fib, n})
  end

  # Server (callbacks)
  def init(:ok) do
    state = Enum.into([{0, 0}, {1, 1}], HashDict.new)
    {:ok, state}
  end

  def handle_call({:fib, n}, _from, state) do
    {result, new_state} = do_fib(n, state)
    {:reply, result, new_state}
  end

  def do_fib(n, cache) do
    if result = cache[n] do
      {result, cache}
    else
      {val, cache} = do_fib(n - 1, cache)
      result = val + cache[n - 2]
      {result, HashDict.put(cache, n, result)}
    end
  end
end
