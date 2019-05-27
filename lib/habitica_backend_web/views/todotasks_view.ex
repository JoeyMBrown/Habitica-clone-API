defmodule HabiticaBackendWeb.TodotasksView do
  use HabiticaBackendWeb, :view

  alias HabiticaBackendWeb.TodotasksView

  def render("index.json", %{todotasks: todotasks}) do
    %{data: render_many(todotasks, TodotasksView, "todotaskslist.json")}
  end

  def render("show.json", %{todotasks: todotasks}) do
    %{data: render_one(todotasks, TodotasksView, "todotasks.json")}
  end

  def render("showupdated.json", %{changes: changes}) do
    %{data: render_one(changes, TodotasksView, "todotasks.json")}
  end

  def render("finishtask.json", %{changes: changes}) do
    %{data: render_one(changes, TodotasksView, "finishedtask.json")}
  end

  def render("finishedtask.json", %{todotasks: todotasks}) do
    %{completed: todotasks.completed}
  end

  def render("todotasks.json", %{todotasks: todotasks}) do
    %{completed: todotasks.completed,
      difficulty: todotasks.difficulty,
      task: todotasks.task}
  end

  def render("todotaskslist.json", %{todotasks: todotasks}) do
    %{completed: todotasks.completed,
      difficulty: todotasks.difficulty,
      task: todotasks.task,
      id: todotasks.id,
      inserted_at: todotasks.inserted_at}
  end
end
