defmodule Pesapie.Repo.Migrations.RenameColumnInProducts do
  use Ecto.Migration

  def change do
    rename table(:products), :stockQuantity, to: :stock_quantity
    rename table(:products), :categoryId, to: :category_id
  end
end
