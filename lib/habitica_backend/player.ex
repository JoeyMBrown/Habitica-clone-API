defmodule HabiticaBackend.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "player" do
    field :exp, :integer
    field :expneeded, :integer
    field :gold, :integer
    field :hp, :integer
    field :level, :integer
    field :mana, :integer
    field :maxhp, :integer
    field :maxmana, :integer
    field :name, :string

    belongs_to :user, HabiticaBackend.Auth.User

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :hp, :mana, :maxhp, :maxmana, :level, :exp, :expneeded, :gold])
    |> validate_required([:name, :hp, :mana, :maxhp, :maxmana, :level, :exp, :expneeded, :gold])
  end
end
