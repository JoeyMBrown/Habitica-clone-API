defmodule HabiticaBackendWeb.Router do
  use HabiticaBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HabiticaBackendWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    post "/users/sign_in", TokenController, :create
    post "/users/sign_up", UserController, :create

    #protected resources below
    resources "/player", PlayerController

    resources "/todos", TodotasksController
    resources "/habits", HabittasksController
    resources "/dailies", DailytasksController
    resources "/completedtasks", CompletedtasksController, only: [:index, :create]
    resources "/rewards", RewardsController, only: [:index, :create]
  end 

end
