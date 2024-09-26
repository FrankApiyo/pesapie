defmodule Pesapie.Repo.Migrations.RenameImageLinkAndReviewIdInReviewImages do
  use Ecto.Migration

  def change do
    rename table(:reviewimages), :reviewId, to: :review_id
    rename table(:reviewimages), :imageLink, to: :imagelink_id
  end
end
