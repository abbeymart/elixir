IO.puts("Hello world from Elixir")


IO.puts("hello " <> "world")

item = {1, 2, 3}

case item do
  {4, 5, 6} ->
    IO.puts("Does not match")
  {1, x, 3} ->
    IO.puts("Match with x value of #{x}")
  _ ->
    IO.puts("Default match - no match")
end
