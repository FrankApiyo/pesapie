defmodule Pesapie.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pesapie.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "bob@hotmail.yahoo",
        password: "somesecretpassword",
        phone: "+254712345678",
        username: "bob"
      })
      |> Pesapie.Accounts.create_user()

    user
  end
end
