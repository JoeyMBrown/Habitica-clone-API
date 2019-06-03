defmodule HabiticaBackend.Habittasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "habit_tasks" do
    field :completed, :boolean, default: false
    field :difficulty, :string
    field :task, :string

    belongs_to :user, HabiticaBackend.Auth.User

    timestamps()
  end

  @doc false
  def changeset(habittasks, attrs) do
    habittasks
    |> cast(attrs, [:task, :difficulty, :completed])
    |> validate_required([:task, :difficulty, :completed])
  end
end
