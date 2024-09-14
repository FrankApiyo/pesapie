defmodule Pesapie.ConversationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pesapie.Conversations` context.
  """

  @doc """
  Generate a conversation.
  """
  def conversation_fixture(attrs \\ %{}) do
    {:ok, conversation} =
      attrs
      |> Enum.into(%{
        is_group: true,
        name: "some name"
      })
      |> Pesapie.Conversations.create_conversation()

    conversation
  end

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        message_text: "some message_text"
      })
      |> Pesapie.Conversations.create_message()

    message
  end

  @doc """
  Generate a conversation_participant.
  """
  def conversation_participant_fixture(attrs \\ %{}) do
    {:ok, conversation_participant} =
      attrs
      |> Enum.into(%{
        joined_at: ~U[2024-09-13 14:42:00Z]
      })
      |> Pesapie.Conversations.create_conversation_participant()

    conversation_participant
  end
end
