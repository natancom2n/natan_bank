defmodule NatanBankWeb.WelcomeControler do
  use NatanBankWeb, :controller

  def index(conn, _params) do
    # IO.inspect(conn)
    # IO.inspect(params)

    conn
    # the atom :ok is the same 200, therefor the atom :not_found is the same 404
    |> put_status(:ok)
    |> json(%{
      message: "Bem vindo ao Natan Bank"
    })
  end
end
