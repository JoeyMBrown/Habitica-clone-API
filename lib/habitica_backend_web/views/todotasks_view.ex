defmodule HabiticaBackendWeb.TodotasksView do
  use HabiticaBackendWeb, :view

  alias HabiticaBackendWeb.TodotasksView

  def render("show.json", %{todotasks: todotasks}) do
    %{data: render_one(todotasks, TodotasksView, "todotasks.json")}
  end

  def render("todotasks.json", %{todotasks: todotasks}) do
    %{completed: todotasks.completed,
      difficulty: todotasks.difficulty,
      task: todotasks.task}
  end
end
