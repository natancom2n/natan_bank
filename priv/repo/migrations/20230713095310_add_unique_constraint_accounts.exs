defmodule NatanBank.Repo.Migrations.AddUniqueConstraintAccounts do
  use Ecto.Migration

  def change do
    create unique_index(:accounts, [:user_id], name: :accounts_unique_id)
  end
end
