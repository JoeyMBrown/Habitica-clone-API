defmodule HabiticaBackend.Dailytasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "daily_tasks" do
    field :completed, :boolean, default: false
    field :difficulty, :string
    field :task, :string

    belongs_to :user, HabiticaBackend.Auth.User

    timestamps()
  end

  @doc false
  def changeset(dailytasks, attrs) do
    dailytasks
    |> cast(attrs, [:task, :difficulty, :completed])
    |> validate_required([:task, :difficulty, :completed])
  end
end
