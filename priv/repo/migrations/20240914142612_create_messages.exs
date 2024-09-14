defmodule Pesapie.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message_text, :text
      add :conversation_id, references(:conversations, on_delete: :nothing)
      add :sender_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:messages, [:conversation_id])
    create index(:messages, [:sender_id])
  end
end
