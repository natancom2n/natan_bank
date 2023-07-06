defmodule NatanBankWeb.UsersJSON do
  alias NatanBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User sucessful created",
      data: data(user)
    }
  end

  def delete(%{user: user}), do: %{message: "User sucessful deleted", data: data(user)}
  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}), do: %{message: "User sucessful upgraded", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      nome: user.nome
    }
  end
end
