# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todo.Repo.insert!(%Todo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Todo.Repo.insert!(%Todo.Todo{task: "learn Elixir", completed: false})
Todo.Repo.insert!(%Todo.Todo{task: "learn Erlang", completed: true})
Todo.Repo.insert!(%Todo.Todo{task: "learn Phoenix", completed: false})