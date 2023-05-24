defmodule RumblWeb.UserView do
  use RumblWeb, :view

  alias Rumbl.Accounts

  def first_name(%Accounts.User{name: name}) do
    String.split(name, " ") |> List.first
  end


end
