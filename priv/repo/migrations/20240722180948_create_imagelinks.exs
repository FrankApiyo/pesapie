defmodule Pesapie.Repo.Migrations.CreateImagelinks do
  use Ecto.Migration

  def change do
    create table(:imagelinks) do
      add :linkURL, :string

      timestamps(type: :utc_datetime)
    end
  end
end
