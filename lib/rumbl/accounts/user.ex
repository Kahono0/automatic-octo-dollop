defmodule Rumbl.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rumbl.Accounts.User

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
  end


  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end



end
