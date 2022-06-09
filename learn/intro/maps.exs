users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]

IO.puts("John age: #{users[:john].age}")

users = put_in(users[:john].age, 30)

IO.puts("John age: #{users[:john].age}")

users = update_in(users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end)

IO.puts("Mary languages: #{users[:mary].languages}")
