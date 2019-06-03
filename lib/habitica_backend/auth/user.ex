defmodule HabiticaBackend.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :is_active, :boolean, default: false
    field :password, :string, virtual: true
    field :password_hash, :string

    has_many :daily_tasks, HabiticaBackend.Dailytasks
    has_many :habit_tasks, HabiticaBackend.Habittasks
    has_many :todo_tasks, HabiticaBackend.Todotasks
    has_many :completed_tasks, HabiticaBackend.Completedtasks

    has_one :player, HabiticaBackend.Player

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :is_active, :password])
    |> validate_required([:email, :is_active, :password])
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
    %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
  ) do
    change(changeset, password_hash: Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset) do
    changeset
  end
end
