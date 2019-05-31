defmodule HabiticaBackendWeb.PlayerController do
  use HabiticaBackendWeb, :controller

  alias HabiticaBackend.Auth
  alias HabiticaBackend.Player

  def create(conn, %{"player" => player_params}) do
    with {:ok, %Player{} = player} <- Auth.create_player(player_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.player_path(conn, :show, player))
      |> render("show.json", player: player)
    end
  end

  def index(conn, _params) do
    players = Auth.list_player()
    render(conn, "index.json", players: players)
  end

  def show(conn, %{"id" => id}) do
    player = Auth.get_player!(id)
    render(conn, "show.json", player: player)
  end

  def update(conn, %{"id" => id, "player" => player_params}) do
    player = Auth.get_player!(id)

    with {:ok, %Player{} = player} <- Auth.update_player(player, player_params) do
      render(conn, "show.json", player: player)
    end
  end

end
