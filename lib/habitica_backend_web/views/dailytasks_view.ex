defmodule HabiticaBackendWeb.DailytasksView do
  use HabiticaBackendWeb, :view

  alias HabiticaBackendWeb.DailytasksView

  def render("index.json", %{dailytasks: dailytasks}) do
    %{data: render_many(dailytasks, DailytasksView, "dailylist.json")}
  end

  def render("show.json", %{dailytasks: dailytasks}) do
    %{data: render_one(dailytasks, DailytasksView, "dailylist.json")}
  end

  def render("dailylist.json", %{dailytasks: dailytasks}) do
    %{completed: dailytasks.completed,
      difficulty: dailytasks.difficulty,
      task: dailytasks.task,
      id: dailytasks.id,
      inserted_at: dailytasks.inserted_at}
  end
end
