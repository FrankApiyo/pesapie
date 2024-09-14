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
end
