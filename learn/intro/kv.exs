defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

# $ iex kv.exs
# iex> {:ok, pid} = KV.start_link()
# {:ok, #PID<0.62.0>}
# iex> send(pid, {:get, :hello, self()})
# {:get, :hello, #PID<0.41.0>}
# iex> flush()
# nil
# :ok

# iex> send(pid, {:put, :hello, :world})
# {:put, :hello, :world}
# iex> send(pid, {:get, :hello, self()})
# {:get, :hello, #PID<0.41.0>}
# iex> flush()
# :world
# :ok

# iex> Process.register(pid, :kv)
# true
# iex> send(:kv, {:get, :hello, self()})
# {:get, :hello, #PID<0.41.0>}
# iex> flush()
# :world
# :ok

# Abstraction using agent
# iex> {:ok, pid} = Agent.start_link(fn -> %{} end)
# {:ok, #PID<0.72.0>}
# iex> Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
# :ok
# iex> Agent.get(pid, fn map -> Map.get(map, :hello) end)
# :world
#
