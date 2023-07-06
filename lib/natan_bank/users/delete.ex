defmodule NatanBank.Users.Delete do
  alias NatanBank.Users.User
  alias NatanBank.Repo

  def call(id) do

    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end

end
