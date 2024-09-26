defmodule Pesapie.Repo.Migrations.RenameImageLinkAndProductIdInProductImage do
  use Ecto.Migration

  def change do
    rename table(:productimages), :productId, to: :product_id
    rename table(:productimages), :imageLink, to: :imagelink_id
  end
end
