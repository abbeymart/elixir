defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end


IO.puts("String-protocol: #{Utility.type("foo")}")
IO.puts("Integer-protocol: #{Utility.type(2000)}")


defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  # @fallback_to_any true
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end

defmodule User do
  defstruct [:name, :age]
end

defimpl Size, for: User do
  def size(_user), do: 2
end

defimpl Size, for: Any do
  def size(_), do: 0
end

defmodule OtherUser do
  @derive [Size]
  defstruct [:name, :age]
end

IO.puts("String-size: #{Size.size("foo")}")
IO.puts("Tuple-size: #{Size.size({:ok, "hello"})}")
IO.puts("Map-size: #{Size.size(%{label: "some label", name: "Abi"})}")

set = %MapSet{} = MapSet.new
IO.puts("MapSet-size: #{Size.size(set)}")

user = %User{name: "Abi", age: 20}
IO.puts("Struct-size (testing): #{Size.size(user)}")
