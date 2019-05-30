defmodule HabiticaBackendWeb.HabittasksView do
  use HabiticaBackendWeb, :view

  alias HabiticaBackendWeb.HabittasksView

  def render("index.json", %{habittasks: habittasks}) do
    %{data: render_many(habittasks, HabittasksView, "habitlist.json")}
  end

  def render("show.json", %{habittasks: habittasks}) do
    %{data: render_one(habittasks, HabittasksView, "habitlist.json")}
  end

  def render("habitlist.json", %{habittasks: habittasks}) do
    %{completed: habittasks.completed,
      difficulty: habittasks.difficulty,
      task: habittasks.task,
      id: habittasks.id,
      inserted_at: habittasks.inserted_at}
  end
end
