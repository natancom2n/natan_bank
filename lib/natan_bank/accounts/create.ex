defmodule NatanBank.Accounts.Create do
  alias NatanBank.Users
  alias NatanBank.Accounts.Account
  alias NatanBank.Repo

  def call(%{"user_id" => id, "balance" => balance} = params) do

    balance =
    balance
    |> Decimal.from_float()
    |> Decimal.round(2)

    with {:ok, _result} <- Users.get(id) do
      params
      |> Map.put("balance", balance)
      |> Account.changeset()
      |> Repo.insert()
    else
      nil -> {:error, :not_found}
    end
  end
end
