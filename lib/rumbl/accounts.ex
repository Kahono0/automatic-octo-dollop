defmodule Rumbl.Accounts do
  alias Rumbl.Accounts.User

  alias Rumbl.Repo

  def list_users do
    Repo.all(User)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def update_user(%User{} = user, attrs) do
    User.changeset(user, attrs)
    |> Repo.update()
  end
end
