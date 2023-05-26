defmodule Rumbl.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  alias Rumbl.Accounts.User
  alias Rumbl.Repo

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def list_users() do
    Repo.all(User)
  end

  def changeset(user, attr) do
    User
    |> cast(attr, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
    |> validate_length(:username, min: 1, max: 20)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

end
