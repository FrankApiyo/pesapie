defmodule Pesapie.Conversations.ConversationParticipant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conversation_participants" do
    field :joined_at, :utc_datetime
    belongs_to(:user, Pesapie.Users.User)
    belongs_to(:conversation, Pesapie.Conversations.Conversation)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(conversation_participant, attrs) do
    conversation_participant
    |> cast(attrs, [:joined_at])
    |> validate_required([:joined_at])
  end
end
