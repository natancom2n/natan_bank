defmodule NatanBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:nome, :password, :email, :cep]

  schema "users" do
    field :nome, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  #SEACHR ABOUT UNIQUE CONSTRANGE ECTO
  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:nome, min: 3)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:cep, min: 8)
    |> add_password_hash()
  end

  defp add_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
end

# params = %{nome: "Natan", cep: "12345678", email: "rafael@fss.com", password: "12344445"}
# alias NatanBank.Users.User
# changeset = User.changeset(params)
# alias NatanBank.Repo
