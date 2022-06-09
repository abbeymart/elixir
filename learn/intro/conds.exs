cond do
  2 + 2 == 5 -> IO.puts("Not valid condition")
  10 * 20 == 200 -> IO.puts("Valid condition")
  2 * 2  == 6 -> IO.puts("Not valid condition")
  true -> IO.puts("Default condition-placeholder")
end

if true do
  IO.puts("True condition")
end
unless true do
  IO.puts("False condition")
end

if nil do
  "Not valid condition"
else
  IO.puts("False condition")
end

x = 120
new_x = if x < 100 do
  x + 1
else
  x
end

IO.puts("Computed new_x: #{new_x}")
