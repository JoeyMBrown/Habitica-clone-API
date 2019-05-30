defmodule HabiticaBackend.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:player) do
      add :name, :string
      add :hp, :integer
      add :mana, :integer
      add :maxhp, :integer
      add :maxmana, :integer
      add :level, :integer
      add :exp, :integer
      add :expneeded, :integer
      add :gold, :integer

      timestamps()
    end

  end
end
