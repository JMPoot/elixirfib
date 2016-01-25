defmodule Elixirfib do
  @doc """
    Calculate the n-th position of the fibonacci sequence

    ## Examples
    
    iex> Elixirfib.fib(0)
    0

    iex> Elixirfib.fib(1)
    1

    iex> Elixirfib.fib(-1)
    0
  """
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) when n > 1 do
    fib(n-1) + fib(n-2)
  end
  def fib(_), do: 0
end
