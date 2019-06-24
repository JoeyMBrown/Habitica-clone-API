defmodule HabiticaBackendWeb.RewardsView do
    use HabiticaBackendWeb, :view
  
    alias HabiticaBackendWeb.RewardsView
  
    def render("index.json", %{rewards: rewards}) do
      %{data: render_many(rewards, RewardsView, "rewards.json")}
    end
  
    def render("show.json", %{rewards: rewards}) do
      %{data: render_one(rewards, RewardsView, "rewards.json")}
    end
  
    def render("rewards.json", %{rewards: rewards}) do
      %{name: rewards.name,
        cost: rewards.cost,
        id: rewards.id
        }
    end
  end