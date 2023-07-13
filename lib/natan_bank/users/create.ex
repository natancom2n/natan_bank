defmodule NatanBank.Users.Create do
  alias NatanBank.Users.User
  alias NatanBank.Repo
  alias NatanBank.ViaCep.Client, as: ViaCepCliente

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepCliente.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()

      # |> handle_insert()
    end
  end

  # defp client() do
  #   Application.get_env(:natan_bank, :via_cep_client, ViaCepCliente)
  # end
end

# params = %{"cep" => "12312312", "email" => "bigjohn@fasil.ie", "name" => "John", "password"=> "1231231"}
