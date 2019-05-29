defmodule HabiticaBackendWeb.CompletedtasksView do
  use HabiticaBackendWeb, :view

  alias HabiticaBackendWeb.CompletedtasksView

  def render("show.json", %{completedtasks: completedtasks}) do
    %{data: render_one(completedtasks, CompletedtasksView, "completedtasks.json")}
  end

  def render("index.json", %{completedtasks: completedtasks}) do
    %{data: render_many(completedtasks, CompletedtasksView, "completedtasks.json")}
  end

  def render("completedtasks.json", %{completedtasks: completedtasks}) do
    %{completed: completedtasks.completed,
      difficulty: completedtasks.difficulty,
      task: completedtasks.task,
      id: completedtasks.id,
      inserted_at: completedtasks.inserted_at}
  end
end
