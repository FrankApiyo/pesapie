defmodule Pesapie.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pesapie.Products` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        categoryName: "some categoryName"
      })
      |> Pesapie.Products.create_category()

    category
  end
end
