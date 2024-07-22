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

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: 120.5,
        stockQuantity: 42
      })
      |> Pesapie.Products.create_product()

    product
  end

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        comment: "some comment",
        rating: 42
      })
      |> Pesapie.Products.create_review()

    review
  end
end
