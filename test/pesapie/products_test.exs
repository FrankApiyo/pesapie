defmodule Pesapie.ProductsTest do
  use Pesapie.DataCase

  alias Pesapie.Products

  describe "categories" do
    alias Pesapie.Products.Category

    import Pesapie.ProductsFixtures

    @invalid_attrs %{categoryName: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Products.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Products.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{categoryName: "some categoryName"}

      assert {:ok, %Category{} = category} = Products.create_category(valid_attrs)
      assert category.categoryName == "some categoryName"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{categoryName: "some updated categoryName"}

      assert {:ok, %Category{} = category} = Products.update_category(category, update_attrs)
      assert category.categoryName == "some updated categoryName"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_category(category, @invalid_attrs)
      assert category == Products.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Products.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Products.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Products.change_category(category)
    end
  end

  describe "products" do
    alias Pesapie.Products.Product

    import Pesapie.ProductsFixtures

    @invalid_attrs %{description: nil, name: nil, price: nil, stockQuantity: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{
        description: "some description",
        name: "some name",
        price: 120.5,
        stockQuantity: 42
      }

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.price == 120.5
      assert product.stockQuantity == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()

      update_attrs = %{
        description: "some updated description",
        name: "some updated name",
        price: 456.7,
        stockQuantity: 43
      }

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.price == 456.7
      assert product.stockQuantity == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "reviews" do
    alias Pesapie.Products.Review

    import Pesapie.ProductsFixtures

    @invalid_attrs %{comment: nil, rating: nil}

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert Products.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert Products.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      valid_attrs = %{comment: "some comment", rating: 42}

      assert {:ok, %Review{} = review} = Products.create_review(valid_attrs)
      assert review.comment == "some comment"
      assert review.rating == 42
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      update_attrs = %{comment: "some updated comment", rating: 43}

      assert {:ok, %Review{} = review} = Products.update_review(review, update_attrs)
      assert review.comment == "some updated comment"
      assert review.rating == 43
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_review(review, @invalid_attrs)
      assert review == Products.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = Products.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> Products.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = Products.change_review(review)
    end
  end

  describe "reviewimages" do
    alias Pesapie.Products.ReviewImage

    import Pesapie.ProductsFixtures

    @invalid_attrs %{}

    test "list_reviewimages/0 returns all reviewimages" do
      review_image = review_image_fixture()
      assert Products.list_reviewimages() == [review_image]
    end

    test "get_review_image!/1 returns the review_image with given id" do
      review_image = review_image_fixture()
      assert Products.get_review_image!(review_image.id) == review_image
    end

    test "create_review_image/1 with valid data creates a review_image" do
      valid_attrs = %{}

      assert {:ok, %ReviewImage{} = review_image} = Products.create_review_image(valid_attrs)
    end

    test "create_review_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_review_image(@invalid_attrs)
    end

    test "update_review_image/2 with valid data updates the review_image" do
      review_image = review_image_fixture()
      update_attrs = %{}

      assert {:ok, %ReviewImage{} = review_image} =
               Products.update_review_image(review_image, update_attrs)
    end

    test "update_review_image/2 with invalid data returns error changeset" do
      review_image = review_image_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Products.update_review_image(review_image, @invalid_attrs)

      assert review_image == Products.get_review_image!(review_image.id)
    end

    test "delete_review_image/1 deletes the review_image" do
      review_image = review_image_fixture()
      assert {:ok, %ReviewImage{}} = Products.delete_review_image(review_image)
      assert_raise Ecto.NoResultsError, fn -> Products.get_review_image!(review_image.id) end
    end

    test "change_review_image/1 returns a review_image changeset" do
      review_image = review_image_fixture()
      assert %Ecto.Changeset{} = Products.change_review_image(review_image)
    end
  end

  alias Pesapie.Account

  describe "imagelinks" do
    alias Pesapie.Product.ImageLink

    import Pesapie.AccountsFixtures
    import Pesapie.ProductsFixtures

    @invalid_attrs %{linkURL: nil}

    test "list_imagelinks/0 returns all imagelinks" do
      image_link = image_link_fixture()
      assert Products.list_imagelinks() == [image_link]
    end

    test "get_image_link!/1 returns the image_link with given id" do
      image_link = image_link_fixture()
      assert Products.get_image_link!(image_link.id) == image_link
    end

    test "create_image_link/1 with valid data creates a image_link" do
      valid_attrs = %{linkURL: "some linkURL"}

      assert {:ok, %ImageLink{} = image_link} = Products.create_image_link(valid_attrs)
      assert image_link.linkURL == "some linkURL"
    end

    test "create_image_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_image_link(@invalid_attrs)
    end

    test "update_image_link/2 with valid data updates the image_link" do
      image_link = image_link_fixture()
      update_attrs = %{linkURL: "some updated linkURL"}

      assert {:ok, %ImageLink{} = image_link} =
               Products.update_image_link(image_link, update_attrs)

      assert image_link.linkURL == "some updated linkURL"
    end

    test "update_image_link/2 with invalid data returns error changeset" do
      image_link = image_link_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_image_link(image_link, @invalid_attrs)
      assert image_link == Products.get_image_link!(image_link.id)
    end

    test "delete_image_link/1 deletes the image_link" do
      image_link = image_link_fixture()
      assert {:ok, %ImageLink{}} = Products.delete_image_link(image_link)
      assert_raise Ecto.NoResultsError, fn -> Products.get_image_link!(image_link.id) end
    end

    test "change_image_link/1 returns a image_link changeset" do
      image_link = image_link_fixture()
      assert %Ecto.Changeset{} = Products.change_image_link(image_link)
    end
  end

  describe "productimages" do
    alias Pesapie.Products.ProductImage

    import Pesapie.ProductsFixtures

    @invalid_attrs %{}

    test "list_productimages/0 returns all productimages" do
      product_image = product_image_fixture()
      assert Products.list_productimages() == [product_image]
    end

    test "get_product_image!/1 returns the product_image with given id" do
      product_image = product_image_fixture()
      assert Products.get_product_image!(product_image.id) == product_image
    end

    test "create_product_image/1 with valid data creates a product_image" do
      valid_attrs = %{}

      assert {:ok, %ProductImage{} = product_image} = Products.create_product_image(valid_attrs)
    end

    test "create_product_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product_image(@invalid_attrs)
    end

    test "update_product_image/2 with valid data updates the product_image" do
      product_image = product_image_fixture()
      update_attrs = %{}

      assert {:ok, %ProductImage{} = product_image} =
               Products.update_product_image(product_image, update_attrs)
    end

    test "update_product_image/2 with invalid data returns error changeset" do
      product_image = product_image_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Products.update_product_image(product_image, @invalid_attrs)

      assert product_image == Products.get_product_image!(product_image.id)
    end

    test "delete_product_image/1 deletes the product_image" do
      product_image = product_image_fixture()
      assert {:ok, %ProductImage{}} = Products.delete_product_image(product_image)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product_image!(product_image.id) end
    end

    test "change_product_image/1 returns a product_image changeset" do
      product_image = product_image_fixture()
      assert %Ecto.Changeset{} = Products.change_product_image(product_image)
    end
  end
end
