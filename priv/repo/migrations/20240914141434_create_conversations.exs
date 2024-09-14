defmodule Pesapie.Repo.Migrations.CreateConversations do
  use Ecto.Migration

  def change do
    create table(:conversations) do
      add :name, :string
      add :is_group, :boolean, default: false, null: false
      add :product_id, references(:products, on_delete: :delete_all), null: true

      timestamps(type: :utc_datetime)
    end
  end
end
