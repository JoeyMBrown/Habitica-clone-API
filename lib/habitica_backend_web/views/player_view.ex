defmodule HabiticaBackendWeb.PlayerView do
  use HabiticaBackendWeb, :view
  alias HabiticaBackendWeb.PlayerView

  def render("show.json", %{player: player}) do
    %{data: render_one(player, PlayerView, "player.json")}
  end

  def render("index.json", %{player: player}) do
    %{data: render_many(player, PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    %{
      name: player.name,
      hp: player.hp,
      mana: player.mana,
      maxhp: player.maxhp,
      maxmana: player.maxmana,
      level: player.level,
      exp: player.exp,
      expneeded: player.expneeded,
      gold: player.gold
    }
  end

end
