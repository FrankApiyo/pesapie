defmodule Pesapie.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :rating, :integer
      add :comment, :string
      add :userId, references(:users, on_delete: :nothing)
      add :productId, references(:products, on_delete: :nothing)
      add :imagelinks, references(:imagelinks, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:reviews, [:userId])
    create index(:reviews, [:productId])
    create index(:reviews, [:imagelinks])
  end
end
