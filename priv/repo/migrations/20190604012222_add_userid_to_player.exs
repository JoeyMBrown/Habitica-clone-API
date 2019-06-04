defmodule HabiticaBackend.Repo.Migrations.AddUseridToPlayer do
  use Ecto.Migration

  def change do
    alter table(:player) do
      add :user_id, references(:users)
    end
  end
end
