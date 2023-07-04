defmodule NatanBankWeb.UsersController do
  use NatanBankWeb, :controller
  alias NatanBank.Users.Create

  def create(conn, params) do
    # IO.inspect(conn)
    # IO.inspect(params)

    # conn
    # the atom :ok is the same 200, therefor the atom :not_found is the same 404
    # |> put_status(:ok)
    # |> json(%{
    #   message: "Bem vindo ao Natan Bank"
    # })

    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    # :created = 201
    |> put_status(:created)
    |> render(:create, user: user)
  end

  defp handle_response({:error, changeset} = error, conn) do
    conn
    # erro 400
    |> put_status(:bad_request)
    |> put_view(json: NatanBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
