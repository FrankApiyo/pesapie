defmodule Pesapie.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pesapie.Account` context.
  """

  @doc """
  Generate a image_link.
  """
  def image_link_fixture(attrs \\ %{}) do
    {:ok, image_link} =
      attrs
      |> Enum.into(%{
        linkURL: "some linkURL"
      })
      |> Pesapie.Account.create_image_link()

    image_link
  end
end
