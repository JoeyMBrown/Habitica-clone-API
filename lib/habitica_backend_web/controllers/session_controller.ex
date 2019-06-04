defmodule HabiticaBackendWeb.SessionController do
  use HabiticaBackendWeb, :controller

  alias HabiticaBackend.Auth
  alias HabiticaBackend.Auth.User

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate_user(email, password) do
      {:ok, %User{id: user_id}} ->
        IO.puts("ID ID ID ID ID ID")
        IO.inspect(user_id)
        IO.puts("ID ID ID ID ID ID")
        conn
        |> put_session(:current_user_id, user_id)
        |> put_status(:ok)
        |> render(HabiticaBackendWeb.UserView, "sign_in.json", user: user)
        |> IO.inspect()

      {:error, message} ->
        conn
        |> delete_session(:current_user_id)
        |> put_status(:unauthorized)
        |> render(HabiticaBackendWeb.ErrorView, "401.json", message: message)
    end
  end

  def delete(conn, _params) do
      conn
      |> delete_session(:current_user_id)
      |> put_status(:ok)
      |> render(HabiticaBackendWeb.UserView, "sign_out.json", message: "Signed out properly!")
  end
end

