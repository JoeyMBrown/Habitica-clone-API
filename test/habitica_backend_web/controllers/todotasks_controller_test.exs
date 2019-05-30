defmodule HabiticaBackendWeb.TodotasksControllerTest do
  use HabiticaBackendWeb.ConnCase

  import HabiticaBackend.Factory

  setup do
  todotasks = insert(:todotasks)

  [todotasks: todotasks]
  end

  describe "index" do
    test "lists all todotasks", %{conn: conn, todotasks: todotasks} do
      conn = get(conn, Routes.todotasks_path(conn, :index))

      assert json_response(conn, 200)["data"] == [
               %{
                "completed" => todotasks.completed,
                "difficulty" => todotasks.difficulty,
                "task" => todotasks.task,
                "id" => todotasks.id,
                "inserted_at" =>  NaiveDateTime.to_iso8601(todotasks.inserted_at)
               }
             ]
    end
  end

end
