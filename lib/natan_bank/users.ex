defmodule NatanBank.Users do
  alias NatanBank.Users.Create
  defdelegate create(params), to: Create, as: :call
end
