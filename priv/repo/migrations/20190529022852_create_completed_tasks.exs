defmodule HabiticaBackend.Repo.Migrations.CreateCompletedTasks do
  use Ecto.Migration

  def change do
    create table(:completed_tasks) do
      add :task, :string
      add :difficulty, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
