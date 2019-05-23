defmodule HabiticaBackendWeb.TodotasksController do
  use HabiticaBackendWeb, :controller

  import Ecto.Query, warn: false
  alias HabiticaBackend.Todotasks
  alias HabiticaBackend.Auth

  def create(conn, %{"todotasks" => task_params}) do
    with {:ok, %Todotasks{} = todotasks} <- Auth.create_todotasks(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todotasks_path(conn, :show))
      |> render("show.json", todotasks: todotasks)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Auth.get_todotasks(id)
    render(conn, "show.json", todotasks: task)
  end

  def delete(conn, %{"id" => id}) do
     case Auth.get_todotasks(id) do
      nil ->
        conn
      |> render(HabiticaBackendWeb.ErrorView, "404.json", message: "Task not found")
      |> halt()

      task ->
          Auth.delete_todotasks(task)
          send_resp(conn, :ok, "Delete Successful")
     end
  end
end
