defmodule Pesapie.Repo.Migrations.RenameOwnerToUserIdInProducts do
  use Ecto.Migration

  def change do
    rename table(:products), :owner, to: :user_id
  end
end
