defmodule Maths do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end
end

sum_result = Maths.sum(100, 100)

# (UndefinedFunctionError) function Maths.do_sum/2 is undefined or private
# do_sum_result = Maths.do_sum(100, 100)

IO.puts("Sum of 100 and 100: #{sum_result}")

# default args
defmodule Concat do
  # A function head declaring defaults
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts Concat.join("Hello", "world")      #=> Hello world
IO.puts Concat.join("Hello", "world", "_") #=> Hello_world
IO.puts Concat.join("Hello")               #=> Hello
IO.puts Concat.join("Hello", "World")

# Accummulate values for a registered attribute
defmodule Foo do
  Module.register_attribute __MODULE__, :param, accumulate: true

  @param :foo
  @param :bar
  # here @param == [:bar, :foo]
end
