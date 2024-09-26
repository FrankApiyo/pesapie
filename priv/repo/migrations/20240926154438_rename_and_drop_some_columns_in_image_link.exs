defmodule Pesapie.Repo.Migrations.RenameAndDropSomeColumnsInImageLink do
  use Ecto.Migration

  def change do
    rename table(:reviews), :productId, to: :product_id
    rename table(:reviews), :userId, to: :user_id

    alter table(:reviews) do
      remove :imagelinks
    end
  end
end
