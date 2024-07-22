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
        email: "some email",
        password: "some password",
        phone: "some phone",
        username: "some username"
      })
      |> Pesapie.Accounts.create_user()

    user
  end
end
