defmodule Pesapie.Conversations.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message_text, :string
    belongs_to(:sender, YourApp.Users.User)
    belongs_to(:conversation, YourApp.Conversations.Conversation)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message_text])
    |> validate_required([:message_text])
  end
end
