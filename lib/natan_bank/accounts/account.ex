defmodule NatanBank.Accounts.Account do
  alias NatanBank.Users.User
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal

    #Define relationship
    belongs_to :user, User #mains the account belongs at an User
    #after this is necessary create same relationship in the controller Users/User

    timestamps()
  end

  def changeset(account \\ %__MODULE__{}, params) do
    account
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive)
  end
end
