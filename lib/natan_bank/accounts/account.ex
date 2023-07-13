defmodule NatanBank.Accounts.Account do
  alias NatanBank.Users.User
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal

    # Define relationship
    # mains the account belongs at an User
    belongs_to :user, User
    # after this is necessary create same relationship in the controller Users/User

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{:__struct__ => atom | %{:__changeset__ => map, optional(any) => any}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(account \\ %__MODULE__{}, params) do
    account
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive)
    |> unique_constraint(:user_id, name: :accounts_unique_id)
  end
end
