defmodule Pesapie.Conversations.Conversation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conversations" do
    field :name, :string
    field :is_group, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:name, :is_group])
    |> validate_required([:name, :is_group])
  end
end
