defmodule Todo.Todo do
  use Todo.Web, :model

  schema "todos" do
    field :task, :string
    field :completed, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:task, :completed])
    |> validate_required([:task, :completed])
  end
end
