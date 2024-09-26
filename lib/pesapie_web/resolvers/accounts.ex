defmodule PesapieWeb.Resolvers.Accounts do
  alias Pesapie.Accounts
  alias PesapieWeb.Schema.ChangesetErrors

  defp sign_token_for_user(user) do
    token = PesapieWeb.AuthToken.sign(user)
    {:ok, %{user: user, token: token}}
  end

  def signin(_, %{username: username, password: password}, _) do
    case Accounts.authenticate(username, password) do
      :error ->
        {:error, "whoops, invalid credentials!"}

      {:ok, user} ->
        sign_token_for_user(user)
    end
  end

  def signup(_, args, _) do
    case Accounts.create_user(args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create account", details: ChangesetErrors.error_details(changeset)
        }

      {:ok, user} ->
        sign_token_for_user(user)
    end
  end

  def me(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end
end
