defmodule HabiticaBackend.Repo.Migrations.AddUserIdToTodotasks do
  use Ecto.Migration

  def change do
    alter table(:todo_tasks) do
      add :user_id, references(:users)
    end
  end
end
