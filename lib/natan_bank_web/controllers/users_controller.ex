defmodule NatanBankWeb.UsersController do
  use NatanBankWeb, :controller
  alias NatanBank.Users
  alias NatanBank.Users.User

  action_fallback NatanBankWeb.FallbackController

  def create(conn, params) do
    with  {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created) # :created = 201
      |> render(:create, user: user)
    end
  end
end
