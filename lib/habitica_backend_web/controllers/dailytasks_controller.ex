defmodule HabiticaBackendWeb.DailytasksController do
  use HabiticaBackendWeb, :controller

  alias HabiticaBackend.Auth
  alias HabiticaBackend.Dailytasks

  def index(conn, _params) do
    dailytasks = Auth.list_dailytasks
    render(conn, "index.json", dailytasks: dailytasks)
  end

  def create(conn, %{"dailytasks" => task_params}) do
    with {:ok, %Dailytasks{} = dailytasks} <- Auth.create_dailytasks(task_params) do
      conn
      |> put_status(:created)
      |> render("show.json", dailytasks: dailytasks)
    end
  end

end
