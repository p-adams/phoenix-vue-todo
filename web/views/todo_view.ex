defmodule Todo.TodoView do
  use Todo.Web, :view

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, Todo.TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, Todo.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      task: todo.task,
      completed: todo.completed}
  end
end
