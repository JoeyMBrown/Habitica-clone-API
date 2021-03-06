defmodule HabiticaBackend.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  alias HabiticaBackend.Repo

  alias HabiticaBackend.Auth.User
  alias HabiticaBackend.Player
  alias HabiticaBackend.Rewards

  alias HabiticaBackend.Completedtasks
  alias HabiticaBackend.Habittasks
  alias HabiticaBackend.Todotasks
  alias HabiticaBackend.Dailytasks

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def authenticate_user(email, password) do
    query = from(u in User, where: u.email == ^email)
    query |> Repo.one() |> verify_password(password)
  end

  defp verify_password(nil, _) do
    Bcrypt.no_user_verify()
    {:error, "Wrong email or password"}
  end

  defp verify_password(user, password) do
    if Bcrypt.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, "Wrong email or password"}
    end
  end

  #Start Todo Task Section #

  def create_todotasks(attrs \\ %{}) do
    %Todotasks{}
    |> Todotasks.changeset(attrs)
    |> Repo.insert()
  end

  def get_todotasks(id), do: Repo.get(Todotasks, id)

  def delete_todotasks(%Todotasks{} = task) do
    Repo.delete(task)
  end

  def change_todotasks(%Todotasks{} = task, changes) do
    changeset = Todotasks.changeset(task, changes)

    changeset
    |> Repo.update()
  end

  def list_todotasks do
    Repo.all(Todotasks)
  end

  #End Todo Task Section #

  #Start Completed Task Section #

  def create_completedtask(attrs \\ %{}) do
    %Completedtasks{}
    |> Completedtasks.changeset(attrs)
    |> Repo.insert()
  end

  def list_completedtasks do
    Repo.all(Completedtasks)
  end

  def get_completedtasks(id), do: Repo.get(Completedtasks, id)

  def delete_completedtasks(%Completedtasks{} = task) do
    Repo.delete(task)
  end

  #End Completed Task Section #

  #Start Habit tasks Section#

  def list_habittasks do
    Repo.all(Habittasks)
  end

  def create_habittasks(attrs \\ %{}) do
    %Habittasks{}
    |> Habittasks.changeset(attrs)
    |> Repo.insert()
  end

  #End Habit tasks Section#

  #Start Daily tasks Section#

  def list_dailytasks do
    Repo.all(Dailytasks)
  end

  def create_dailytasks(attrs \\ %{}) do
    %Dailytasks{}
    |> Dailytasks.changeset(attrs)
    |> Repo.insert()
  end

  #End Daily tasks Section#

  #Start Player Section#

  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  def get_player!(id), do: Repo.get!(Player, id)

  def list_player do
    Repo.all(Player)
  end

  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  #End Player Section#

  #Start Reward Section#

  def list_rewards do
    Repo.all(Rewards)
  end

  def create_rewards(attrs \\ %{}) do
    %Rewards{}
    |> Rewards.changeset(attrs)
    |> Repo.insert()
  end

  #End Reward Section#
end
