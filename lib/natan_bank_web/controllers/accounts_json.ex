defmodule NatanBankWeb.AccountsJSON do
  alias NatanBank.Accounts.Account

  def create(%{account: account}) do
    %{
      message: "Account sucessful created",
      data: data(account)
    }
  end

  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}) do
    %{
      message: "Sucessful Transfer",
      from_account: data(from_account),
      to_account: data(to_account)
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      balance: account.balance
    }
  end
end
