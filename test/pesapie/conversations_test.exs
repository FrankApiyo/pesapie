defmodule Pesapie.ConversationsTest do
  use Pesapie.DataCase

  alias Pesapie.Conversations

  describe "conversations" do
    alias Pesapie.Conversations.Conversation

    import Pesapie.ConversationsFixtures

    @invalid_attrs %{name: nil, is_group: nil}

    test "list_conversations/0 returns all conversations" do
      conversation = conversation_fixture()
      assert Conversations.list_conversations() == [conversation]
    end

    test "get_conversation!/1 returns the conversation with given id" do
      conversation = conversation_fixture()
      assert Conversations.get_conversation!(conversation.id) == conversation
    end

    test "create_conversation/1 with valid data creates a conversation" do
      valid_attrs = %{name: "some name", is_group: true}

      assert {:ok, %Conversation{} = conversation} = Conversations.create_conversation(valid_attrs)
      assert conversation.name == "some name"
      assert conversation.is_group == true
    end

    test "create_conversation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conversations.create_conversation(@invalid_attrs)
    end

    test "update_conversation/2 with valid data updates the conversation" do
      conversation = conversation_fixture()
      update_attrs = %{name: "some updated name", is_group: false}

      assert {:ok, %Conversation{} = conversation} = Conversations.update_conversation(conversation, update_attrs)
      assert conversation.name == "some updated name"
      assert conversation.is_group == false
    end

    test "update_conversation/2 with invalid data returns error changeset" do
      conversation = conversation_fixture()
      assert {:error, %Ecto.Changeset{}} = Conversations.update_conversation(conversation, @invalid_attrs)
      assert conversation == Conversations.get_conversation!(conversation.id)
    end

    test "delete_conversation/1 deletes the conversation" do
      conversation = conversation_fixture()
      assert {:ok, %Conversation{}} = Conversations.delete_conversation(conversation)
      assert_raise Ecto.NoResultsError, fn -> Conversations.get_conversation!(conversation.id) end
    end

    test "change_conversation/1 returns a conversation changeset" do
      conversation = conversation_fixture()
      assert %Ecto.Changeset{} = Conversations.change_conversation(conversation)
    end
  end

  describe "messages" do
    alias Pesapie.Conversations.Message

    import Pesapie.ConversationsFixtures

    @invalid_attrs %{message_text: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Conversations.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Conversations.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{message_text: "some message_text"}

      assert {:ok, %Message{} = message} = Conversations.create_message(valid_attrs)
      assert message.message_text == "some message_text"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conversations.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{message_text: "some updated message_text"}

      assert {:ok, %Message{} = message} = Conversations.update_message(message, update_attrs)
      assert message.message_text == "some updated message_text"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Conversations.update_message(message, @invalid_attrs)
      assert message == Conversations.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Conversations.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Conversations.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Conversations.change_message(message)
    end
  end

  describe "conversation_participants" do
    alias Pesapie.Conversations.ConversationParticipant

    import Pesapie.ConversationsFixtures

    @invalid_attrs %{joined_at: nil}

    test "list_conversation_participants/0 returns all conversation_participants" do
      conversation_participant = conversation_participant_fixture()
      assert Conversations.list_conversation_participants() == [conversation_participant]
    end

    test "get_conversation_participant!/1 returns the conversation_participant with given id" do
      conversation_participant = conversation_participant_fixture()
      assert Conversations.get_conversation_participant!(conversation_participant.id) == conversation_participant
    end

    test "create_conversation_participant/1 with valid data creates a conversation_participant" do
      valid_attrs = %{joined_at: ~U[2024-09-13 14:42:00Z]}

      assert {:ok, %ConversationParticipant{} = conversation_participant} = Conversations.create_conversation_participant(valid_attrs)
      assert conversation_participant.joined_at == ~U[2024-09-13 14:42:00Z]
    end

    test "create_conversation_participant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conversations.create_conversation_participant(@invalid_attrs)
    end

    test "update_conversation_participant/2 with valid data updates the conversation_participant" do
      conversation_participant = conversation_participant_fixture()
      update_attrs = %{joined_at: ~U[2024-09-14 14:42:00Z]}

      assert {:ok, %ConversationParticipant{} = conversation_participant} = Conversations.update_conversation_participant(conversation_participant, update_attrs)
      assert conversation_participant.joined_at == ~U[2024-09-14 14:42:00Z]
    end

    test "update_conversation_participant/2 with invalid data returns error changeset" do
      conversation_participant = conversation_participant_fixture()
      assert {:error, %Ecto.Changeset{}} = Conversations.update_conversation_participant(conversation_participant, @invalid_attrs)
      assert conversation_participant == Conversations.get_conversation_participant!(conversation_participant.id)
    end

    test "delete_conversation_participant/1 deletes the conversation_participant" do
      conversation_participant = conversation_participant_fixture()
      assert {:ok, %ConversationParticipant{}} = Conversations.delete_conversation_participant(conversation_participant)
      assert_raise Ecto.NoResultsError, fn -> Conversations.get_conversation_participant!(conversation_participant.id) end
    end

    test "change_conversation_participant/1 returns a conversation_participant changeset" do
      conversation_participant = conversation_participant_fixture()
      assert %Ecto.Changeset{} = Conversations.change_conversation_participant(conversation_participant)
    end
  end
end
