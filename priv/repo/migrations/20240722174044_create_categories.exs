defmodule Pesapie.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :categoryName, :string
      add :parentCategoryId, references(:categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:categories, [:parentCategoryId])
  end
end
