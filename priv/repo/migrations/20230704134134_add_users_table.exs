defmodule NatanBank.Repo.Migrations.AddUsersTable do
  use Ecto.Migration
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  ### search about unique constrange ECTO
  def change do
    create table("users") do
      add :name, :string, null: false
      add :password_hash, :string, null: false
      add :email, :string, null: false
      add :cep, :string, null: false

      timestamps()
    end
  end
end
