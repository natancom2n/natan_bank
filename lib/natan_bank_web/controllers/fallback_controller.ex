defmodule NatanBankWeb.FallbackController do
  use NatanBankWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    # erro 404
    |> put_status(:not_found)
    |> put_view(json: NatanBankWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(conn, {:error, changeset}) do
    conn
    # erro 400
    |> put_status(:bad_request)
    |> put_view(json: NatanBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
