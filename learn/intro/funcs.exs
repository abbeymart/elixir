# anonymous function with guard
f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end

IO.puts("x * y = #{f.(0, 1)}")

IO.puts("x + y = #{f.(1, 1)}")
