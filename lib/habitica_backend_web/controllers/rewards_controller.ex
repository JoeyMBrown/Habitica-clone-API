
  defmodule HabiticaBackendWeb.RewardsController do
    use HabiticaBackendWeb, :controller
  
    alias HabiticaBackend.Auth
    alias HabiticaBackend.Rewards
  
    def index(conn, _params) do
      rewards = Auth.list_rewards
      render(conn, "index.json", rewards: rewards)
    end
  
    def create(conn, %{"rewards" => task_params}) do
      with {:ok, %Rewards{} = rewards} <- Auth.create_rewards(task_params) do
        conn
        |> put_status(:created)
        |> render("show.json", rewards: rewards)
      end
    end
  
  end