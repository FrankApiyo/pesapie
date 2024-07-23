defmodule Pesapie.Repo.Migrations.CreateProductimages do
  use Ecto.Migration

  def change do
    create table(:productimages) do
      add :productId, references(:products, on_delete: :nothing)
      add :imageLink, references(:imagelinks, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:productimages, [:productId])
    create index(:productimages, [:imageLink])
  end
end
