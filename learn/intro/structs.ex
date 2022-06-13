defmodule User do
  # defstruct name: "John", age: 30
  # you must first specify the fields which implicitly default to nil:
  defstruct [:email, name: "John", age: 27]
end

defmodule Car do
  @enforce_keys [:make]     # required key
  defstruct [:model, :make]
end
