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

  def delete(conn, %{"id" => id}) do
    with  {:ok, %User{} = user} <- Users.delete(id) do
      conn
      |> put_status(:ok) # :created = 201
      |> render(:delete, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with  {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok) # :created = 201
      |> render(:delete, user: user)
    end
  end

  def update(conn, params) do
    with  {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok) # :created = 201
      |> render(:update, user: user)
    end
  end

end
