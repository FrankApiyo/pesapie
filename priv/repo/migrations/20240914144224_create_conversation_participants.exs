defmodule Pesapie.Repo.Migrations.CreateConversationParticipants do
  use Ecto.Migration

  def change do
    create table(:conversation_participants) do
      add :joined_at, :utc_datetime
      add :conversation_id, references(:conversations, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:conversation_participants, [:conversation_id])
    create index(:conversation_participants, [:user_id])
  end
end
