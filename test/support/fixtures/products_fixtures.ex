defmodule Pesapie.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pesapie.Products` context.
  """
  alias Pesapie.AccountsFixtures

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
      Pesapie.Products.create_product(
        AccountsFixtures.user_fixture(),
        Enum.into(attrs, %{
          description: "some description",
          name: "some name",
          price: 120.5,
          stockQuantity: 42
        })
      )

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

  @doc """
  Generate a review_image.
  """
  def review_image_fixture(attrs \\ %{}) do
    {:ok, review_image} =
      Pesapie.Products.create_review_image(
        review_fixture(),
        image_link_fixture(),
        Enum.into(attrs, %{})
      )

    review_image
  end

  @doc """
  Generate a image_link.
  """
  def image_link_fixture(attrs \\ %{}) do
    {:ok, image_link} =
      attrs
      |> Enum.into(%{
        linkURL: "some linkURL"
      })
      |> Pesapie.Products.create_image_link()

    image_link
  end

  @doc """
  Generate a product_image.
  """
  def product_image_fixture(attrs \\ %{}) do
    {:ok, product_image} =
      Pesapie.Products.create_product_image(
        product_fixture(),
        image_link_fixture(),
        Enum.into(attrs, %{})
      )

    product_image
  end
end
