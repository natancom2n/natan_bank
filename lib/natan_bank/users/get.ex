defmodule NatanBank.Users.Get do
  alias NatanBank.Users.User
  alias NatanBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
