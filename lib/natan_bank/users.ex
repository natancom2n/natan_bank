defmodule NatanBank.Users do
  alias NatanBank.Users.Create
  alias NatanBank.Users.Delete
  alias NatanBank.Users.Get
  alias NatanBank.Users.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate delete(params), to: Delete, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
end
