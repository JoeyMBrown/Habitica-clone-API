defmodule HabiticaBackend.Todotasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_tasks" do
    field :completed, :boolean, default: false
    field :difficulty, :string
    field :task, :string
    belongs_to :user, HabiticaBackend.Auth.User

    timestamps()
  end

  @doc false
  def changeset(todotasks, attrs) do
    todotasks
    |> cast(attrs, [:task, :difficulty, :completed])
    |> validate_required([:task, :difficulty, :completed])
  end
end
