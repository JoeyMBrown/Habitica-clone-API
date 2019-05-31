defmodule HabiticaBackendWeb.CompletedtasksController do
  use HabiticaBackendWeb, :controller

  alias HabiticaBackend.Completedtasks
  alias HabiticaBackend.Auth

  def create(conn, %{"completedtasks" => task_params}) do
    with {:ok, %Completedtasks{} = completedtasks} <- Auth.create_completedtask(task_params) do
      conn
      |> put_status(:created)
      |> render("show.json", completedtasks: completedtasks)
    end
  end

  def index(conn, _params) do
    completedtasks = Auth.list_completedtasks
    render(conn, "index.json", completedtasks: completedtasks)
  end

  def delete(conn, %{"id" => id}) do
    case Auth.get_completedtasks(id) do
     nil ->
       conn
     |> render(HabiticaBackendWeb.ErrorView, "404.json", message: "Task not found")
     |> halt()

     task ->
         Auth.delete_completedtasks(task)
         send_resp(conn, :ok, "Delete Successful")
    end
 end

end
