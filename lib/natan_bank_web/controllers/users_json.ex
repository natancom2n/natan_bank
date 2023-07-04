defmodule NatanBankWeb.UsersJSON do
  alias NatanBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User sucessful created",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      nome: user.nome
    }
  end
end
