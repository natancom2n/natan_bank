defmodule NatanBankWeb.UsersController do
  use NatanBankWeb, :controller
  alias NatanBank.Users
  alias NatanBank.Users.User

  action_fallback NatanBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      # :created = 201
      |> put_status(:created)
      # view of users_json.ex
      |> render(:create, user: user)
    end
  end

  @spec delete(any, map) :: any
  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.delete(id) do
      conn
      # :created = 201
      |> put_status(:ok)
      |> render(:delete, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      # :created = 201
      |> put_status(:ok)
      |> render(:delete, user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      # :created = 201
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end
end
