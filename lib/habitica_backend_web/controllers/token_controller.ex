defmodule HabiticaBackendWeb.TokenController do
    use HabiticaBackendWeb, :controller
  
    alias HabiticaBackend.Auth

def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, token, claims} = HabiticaBackend.Auth.Guardian.encode_and_sign(user)
        IO.puts(token)
        conn
        |> put_status(:ok)
        |> render(HabiticaBackendWeb.UserView, "jwt.json", user: token)

      {:error, message} ->
        conn
        |> put_status(:unauthorized)
        |> render(HabiticaBackendWeb.ErrorView, "401.json", message: message)
    end
  end
end