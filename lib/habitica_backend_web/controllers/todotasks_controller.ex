defmodule HabiticaBackendWeb.TodotasksController do
  use HabiticaBackendWeb, :controller

  import Ecto.Query, warn: false
  alias HabiticaBackend.Todotasks
  alias HabiticaBackend.Auth

  def create(conn, %{"todotasks" => task_params}) do
    #changeset = conn.assigns.current_user
    IO.puts("_)_)_)_)_)_)_)_)_)_)_)")
    IO.inspect(conn)
    IO.puts("_)_)_)_)_)_)_)_)_)_)_)")
    with {:ok, %Todotasks{} = todotasks} <- Auth.create_todotasks(task_params) do
      conn
      |> put_status(:created)
      |> render("show.json", todotasks: todotasks)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Auth.get_todotasks(id)
    render(conn, "show.json", todotasks: task)
  end

  def index(conn, _params) do
    todotasks = Auth.list_todotasks
    render(conn, "index.json", todotasks: todotasks)
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


#Big problem with edit, handling an update request that doesn't change the values in the DB.
#If you try to update a DB thats value is 5.  And the updated value is 5, this will throw an error.
  def edit(conn, %{"id" => id, "todotasks" => changes}) do
    case Auth.get_todotasks(id) do
      nil ->
        conn
      |> render(HabiticaBackendWeb.ErrorView, "404.json", message: "Task not found")
      |> halt()

      task ->
        changeset = Todotasks.changeset(task, changes)
        Auth.change_todotasks(task, changes)

      case changeset do
        %{changes: %{completed: _completed, difficulty: _difficulty, task: _task}} ->
        render(conn, "showupdated.json", changeset)

        %{changes: %{completed: _completed}} ->
          render(conn, "finishtask.json", changeset)

        _ ->
          IO.inspect(changeset)
          conn
          |> render(HabiticaBackendWeb.ErrorView, "404.json", message: "Task not found")
          |> halt()
      end
    end
  end
end
