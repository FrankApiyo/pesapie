defmodule Pesapie.Conversations do
  @moduledoc """
  The Conversations context.
  """

  import Ecto.Query, warn: false
  alias Pesapie.Repo

  alias Pesapie.Conversations.Conversation

  @doc """
  Returns the list of conversations.

  ## Examples

      iex> list_conversations()
      [%Conversation{}, ...]

  """
  def list_conversations do
    Repo.all(Conversation)
  end

  @doc """
  Gets a single conversation.

  Raises `Ecto.NoResultsError` if the Conversation does not exist.

  ## Examples

      iex> get_conversation!(123)
      %Conversation{}

      iex> get_conversation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conversation!(id), do: Repo.get!(Conversation, id)

  @doc """
  Creates a conversation.

  ## Examples

      iex> create_conversation(%{field: value})
      {:ok, %Conversation{}}

      iex> create_conversation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conversation(attrs \\ %{}) do
    %Conversation{}
    |> Conversation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conversation.

  ## Examples

      iex> update_conversation(conversation, %{field: new_value})
      {:ok, %Conversation{}}

      iex> update_conversation(conversation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conversation(%Conversation{} = conversation, attrs) do
    conversation
    |> Conversation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a conversation.

  ## Examples

      iex> delete_conversation(conversation)
      {:ok, %Conversation{}}

      iex> delete_conversation(conversation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conversation(%Conversation{} = conversation) do
    Repo.delete(conversation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conversation changes.

  ## Examples

      iex> change_conversation(conversation)
      %Ecto.Changeset{data: %Conversation{}}

  """
  def change_conversation(%Conversation{} = conversation, attrs \\ %{}) do
    Conversation.changeset(conversation, attrs)
  end

  alias Pesapie.Conversations.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end

  alias Pesapie.Conversations.ConversationParticipant

  @doc """
  Returns the list of conversation_participants.

  ## Examples

      iex> list_conversation_participants()
      [%ConversationParticipant{}, ...]

  """
  def list_conversation_participants do
    Repo.all(ConversationParticipant)
  end

  @doc """
  Gets a single conversation_participant.

  Raises `Ecto.NoResultsError` if the Conversation participant does not exist.

  ## Examples

      iex> get_conversation_participant!(123)
      %ConversationParticipant{}

      iex> get_conversation_participant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conversation_participant!(id), do: Repo.get!(ConversationParticipant, id)

  @doc """
  Creates a conversation_participant.

  ## Examples

      iex> create_conversation_participant(%{field: value})
      {:ok, %ConversationParticipant{}}

      iex> create_conversation_participant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conversation_participant(attrs \\ %{}) do
    %ConversationParticipant{}
    |> ConversationParticipant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conversation_participant.

  ## Examples

      iex> update_conversation_participant(conversation_participant, %{field: new_value})
      {:ok, %ConversationParticipant{}}

      iex> update_conversation_participant(conversation_participant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conversation_participant(%ConversationParticipant{} = conversation_participant, attrs) do
    conversation_participant
    |> ConversationParticipant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a conversation_participant.

  ## Examples

      iex> delete_conversation_participant(conversation_participant)
      {:ok, %ConversationParticipant{}}

      iex> delete_conversation_participant(conversation_participant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conversation_participant(%ConversationParticipant{} = conversation_participant) do
    Repo.delete(conversation_participant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conversation_participant changes.

  ## Examples

      iex> change_conversation_participant(conversation_participant)
      %Ecto.Changeset{data: %ConversationParticipant{}}

  """
  def change_conversation_participant(%ConversationParticipant{} = conversation_participant, attrs \\ %{}) do
    ConversationParticipant.changeset(conversation_participant, attrs)
  end
end
