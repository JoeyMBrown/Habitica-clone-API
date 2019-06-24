defmodule HabiticaBackend.Rewards do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rewards" do
    field :name, :string
    field :cost, :integer

    timestamps()
  end

  @doc false
  def changeset(rewards, attrs) do
    rewards
    |> cast(attrs, [:name, :cost])
    |> validate_required([:name, :cost])
  end
end
