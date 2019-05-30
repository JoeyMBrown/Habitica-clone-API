defmodule HabiticaBackendWeb.HabittasksController do
  use HabiticaBackendWeb, :controller

  alias HabiticaBackend.Auth
  alias HabiticaBackend.Habittasks

  def index(conn, _params) do
    habittasks = Auth.list_habittasks
    render(conn, "index.json", habittasks: habittasks)
  end

  def create(conn, %{"habittasks" => task_params}) do
    with {:ok, %Habittasks{} = habittasks} <- Auth.create_habittasks(task_params) do
      conn
      |> put_status(:created)
      |> render("show.json", habittasks: habittasks)
    end
  end

end
