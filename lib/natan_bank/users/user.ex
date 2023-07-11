defmodule NatanBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias NatanBank.Accounts.Account

  @required_params_create [:name, :password, :email, :cep]
  @required_params_update [:name, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string
    #docs: Ecto associetions
    has_one :account, Account

    timestamps()
  end

  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  # SEACHR ABOUT UNIQUE CONSTRANGE ECTO

  # Changeset of Create
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_update)
    |> add_password_hash()
  end

  # Changeset of UPDATE
  def changeset(user, params) do
    user
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_update)
    |> add_password_hash()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, min: 8)
  end

  defp add_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
end

# params = %{name: "Natan", cep: "12345678", email: "rafael@fss.com", password: "12344445"}
# alias NatanBank.Users.User
# changeset = User.changeset(params)
# alias NatanBank.Repo
