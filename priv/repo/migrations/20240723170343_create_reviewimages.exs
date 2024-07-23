defmodule Pesapie.Repo.Migrations.CreateReviewimages do
  use Ecto.Migration

  def change do
    create table(:reviewimages) do
      add :reviewId, references(:reviews, on_delete: :nothing)
      add :imageLink, references(:imagelinks, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:reviewimages, [:reviewId])
    create index(:reviewimages, [:imageLink])
  end
end
