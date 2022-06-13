item = {1, 2, 3}

case item do
  {4, 5, 6} ->
    IO.puts("Does not match")
  {1, x, 3} ->
    IO.puts("Match with x value of #{x}")
  _ ->
    IO.puts("Default match - no match")
end


x = 1

case 10 do
  ^x -> IO.puts("Not match")
  _ -> IO.puts("Default match for x: #{x}")
end

case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    IO.puts("Match x [#{x}] > 0")
  _ ->
    IO.puts("Default match - no match")
end

case 1 do
  x when hd(x) -> IO.puts("Won't match")
  x -> IO.puts("Got #{x}")
end
