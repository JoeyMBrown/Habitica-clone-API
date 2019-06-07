defmodule HabiticaBackend.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :is_active, :boolean, default: false
    field :password, :string, virtual: true
    field :password_hash, :string

    has_many :dailytasks, HabiticaBackend.Dailytasks
    has_many :habittasks, HabiticaBackend.Habittasks
    has_many :todotasks, HabiticaBackend.Todotasks
    has_many :completedtasks, HabiticaBackend.Completedtasks

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
