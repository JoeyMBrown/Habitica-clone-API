defmodule HabiticaBackendWeb.SessionController do
  use HabiticaBackendWeb, :controller

  alias HabiticaBackend.Auth

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_status(:ok)
        |> render(HabiticaBackendWeb.UserView, "sign_in.json", user: user)

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

