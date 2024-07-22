defmodule Pesapie.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :stockQuantity, :integer
      add :categoryId, references(:categories, on_delete: :nothing)
      add :owner, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:products, [:categoryId])
    create index(:products, [:owner])
  end
end
