defmodule Pesapie.Repo.Migrations.AddNotNullConstraintToReviewImage do
  use Ecto.Migration

  def change do
    alter table(:reviewimages) do
      modify :reviewId, :bigint, null: false
      modify :imageLink, :bigint, null: false
    end
  end
end
