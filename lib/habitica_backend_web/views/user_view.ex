defmodule HabiticaBackendWeb.UserView do
  use HabiticaBackendWeb, :view
  alias HabiticaBackendWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("jwt.json", %{user: token}) do
    %{data: render_one(token, UserView, "jsontoken.json")}
  end

  def render("jsontoken.json", %{user: token}) do
    %{token: token}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      is_active: user.is_active}
  end

  def render("sign_in.json", %{user: user}) do
    %{
      data: %{
        user: %{
          id: user.id,
          email: user.email,
          is_active: user.is_active
        }
      }
    }
  end

  def render("sign_out.json", %{message: message}) do
    %{info: %{detail: message}}
  end
end
