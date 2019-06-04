defmodule HabiticaBackendWeb.Router do
  use HabiticaBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :api_auth do
    plug :ensure_authenticated
  end

  scope "/api", HabiticaBackendWeb do
    pipe_through :api

    #post "/users/sign_up", UserController, :create
    post "/users/sign_in", SessionController, :create
    delete "/users/sign_out", SessionController, :delete

    resources "/player", PlayerController

    #resources "/todos", TodotasksController
    resources "/habits", HabittasksController
    resources "/dailies", DailytasksController
    resources "/completedtasks", CompletedtasksController, only: [:index, :create]
  end

  scope "/api", HabiticaBackendWeb do
    pipe_through [:api, :api_auth]
    resources "/users", UserController, except: [:new, :edit]

    resources "/todos", TodotasksController
  end

  # Plug function
  defp ensure_authenticated(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)

    IO.puts(")!*@#!@$!@$)!@%#*%$*#(^#(%)$@%@#%(@%)@^@#^@$^@")
    IO.inspect(current_user_id)
    IO.puts(")!*@#!@$!@$)!@%#*%$*#(^#(%)$@%@#%(@%)@^@#^@$^@")

    if current_user_id do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> render(HabiticaBackendWeb.ErrorView, "401.json", message: "Unauthenticated user")
      |> halt()
    end
  end
end
