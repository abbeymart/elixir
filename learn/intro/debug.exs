
defmodule DebugModule do
  def some_fun(a, b, c) do
    IO.inspect binding()
    # require IEx; IEx.pry
  end
end

IO.puts(DebugModule.some_fun(:foo, "bar", :baz))
