defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  def print_multiple_times(msg, n) when n < 0 do
    IO.puts("Repeated count must be greater than zero")
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end
end

Recursion.print_multiple_times("Hello!", 3)
Recursion.print_multiple_times("Hello!", -1)

IO.puts("\nSum and Multiplication of list recursion")

defmodule Math do
  def sum_list(list) do
    # sum_list(tail, head + accumulator)
    # Enum.reduce(list, 0, fn(x, acc) -> x + acc end)
    Enum.reduce(list, 0, &+/2)
  end

  # def sum_list([], accumulator) do
  #   accumulator
  # end

  def mut_list(list) do
    # mut_list(tail, head * acc)
    # Enum.reduce(list, 1, fn(x, acc) -> x * acc end)
    Enum.reduce(list, 1, &*/2)
  end

  # def mut_list([], acc) do
  #   acc
  # end

  def double_each(list) do
    # [head * 2 | double_each(tail)]
    # Enum.map(list, fn(x) -> x * 2 end)
    Enum.map(list, &(&1 * 2))
  end

  # def double_each([]) do
  #   []
  # end

end

double_result = Math.double_each([1, 2, 3])

# IO.puts Math.sum_list([1, 2, 3], 0) #=> 6
# IO.puts Math.mut_list([1, 2, 3], 1) #=> 6
# IO.puts("#{double_result}") #=> [2, 3, 6]


IO.puts Math.sum_list([1, 2, 3]) #=> 6
IO.puts Math.mut_list([2, 2, 3]) #=> 6
IO.puts("#{Enum.join(double_result, ", ")}") #=> [2, 3, 6]
