defmodule HabiticaBackend.Repo.Migrations.CreateTodoTasks do
  use Ecto.Migration

  def change do
    create table(:todo_tasks) do
      add :task, :string
      add :difficulty, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
