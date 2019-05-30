defmodule HabiticaBackend.Repo.Migrations.CreateHabitTasks do
  use Ecto.Migration

  def change do
    create table(:habit_tasks) do
      add :task, :string
      add :difficulty, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
