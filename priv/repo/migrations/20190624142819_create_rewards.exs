defmodule HabiticaBackend.Repo.Migrations.CreateRewards do
  use Ecto.Migration

  def change do
    create table(:rewards) do
      add :name, :string
      add :cost, :integer

      timestamps()
    end

  end
end
