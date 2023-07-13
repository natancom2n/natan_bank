defmodule NatanBank.Accounts do
  alias NatanBank.Accounts.Create
  alias NatanBank.Accounts.Trasaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(params), to: Trasaction, as: :call
end
