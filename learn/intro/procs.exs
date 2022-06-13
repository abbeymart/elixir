# send(self(), {:hello, "world"})
# send(self(), {:hello, self()})
parent = self()
spawn(fn -> send(parent, {:hello, self()}) end)


receive do
  # {:hello, msg} -> IO.puts("Received: #{msg}")
  # {:world, _msg} -> IO.puts("Default - Won't match")
  {:hello, pid} -> IO.puts("Got hello from #{inspect pid}")
after
  1_000 -> IO.puts("Timeout after 1s")
end
