defmodule NatanBankWeb.AccountsController do
  use NatanBankWeb, :controller
  alias NatanBank.Accounts
  alias NatanBank.Accounts.Account

  action_fallback NatanBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account) #view of users_json.ex
    end
  end

  def transaction(conn, params) do
    with {:ok, transaction} <- Accounts.transaction(params) do

      conn
      |> put_status(:ok)
      |> render(:transaction, transaction: transaction) #view of users_json.ex
    end
  end

end
