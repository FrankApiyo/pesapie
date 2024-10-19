defmodule Pesapie.Products do
  @moduledoc """
  The Products context.
  """

  import Ecto.Query, warn: false
  alias Pesapie.Repo

  alias Pesapie.Products.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Pesapie.Products.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Gets a single product given id

  Return nil if the Product does not exist.

  ## Examples

      iex> get_product(123)
      %Product{}

      iex> get_product(456)
      nil

  """
  def get_product(id), do: Repo.get(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> user = %User{id: 1}
      iex> create_product(user, %{field: value})
      {:ok, %Product{}}

      iex> create_product(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:products)
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias Pesapie.Products.Review

  @doc """
  Returns the list of reviews.

  ## Examples

      iex> list_reviews()
      [%Review{}, ...]

  """
  def list_reviews do
    Repo.all(Review)
  end

  @doc """
  Gets a single review.

  Raises `Ecto.NoResultsError` if the Review does not exist.

  ## Examples

      iex> get_review!(123)
      %Review{}

      iex> get_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_review!(id), do: Repo.get!(Review, id)

  @doc """
  Creates a review.

  ## Examples
      iex> user = %User{id: 1}
      iex> product = %Product{id: 1}
      iex> create_review(user, product, %{comment: "comment", rating: 5})
      {:ok, %Review{}}

      iex> create_review(user, product, %{comment: 1})
      {:error, %Ecto.Changeset{}}

  """
  def create_review(user, product, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:reviews, product_id: product.id)
    |> Review.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a review.

  ## Examples

      iex> update_review(review, %{field: new_value})
      {:ok, %Review{}}

      iex> update_review(review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_review(%Review{} = review, attrs) do
    review
    |> Review.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a review.

  ## Examples

      iex> delete_review(review)
      {:ok, %Review{}}

      iex> delete_review(review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_review(%Review{} = review) do
    Repo.delete(review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking review changes.

  ## Examples

      iex> change_review(review)
      %Ecto.Changeset{data: %Review{}}

  """
  def change_review(%Review{} = review, attrs \\ %{}) do
    Review.changeset(review, attrs)
  end

  alias Pesapie.Products.ReviewImage

  @doc """
  Returns the list of reviewimages.

  ## Examples

      iex> list_reviewimages()
      [%ReviewImage{}, ...]

  """
  def list_reviewimages do
    Repo.all(ReviewImage)
  end

  @doc """
  Gets a single review_image.

  Raises `Ecto.NoResultsError` if the Review image does not exist.

  ## Examples

      iex> get_review_image!(123)
      %ReviewImage{}

      iex> get_review_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_review_image!(id), do: Repo.get!(ReviewImage, id)

  @doc """
  Creates a review_image.

  ## Examples

      iex> create_review_image(review, image_link, %{field: value})
      {:ok, %ReviewImage{}}

      iex> create_review_image(review, image_link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_review_image(review, image_link, attrs \\ %{}) do
    review
    |> Ecto.build_assoc(:reviewimages, imagelink_id: image_link.id)
    |> ReviewImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a review_image.

  ## Examples

      iex> update_review_image(review_image, %{field: new_value})
      {:ok, %ReviewImage{}}

      iex> update_review_image(review_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_review_image(%ReviewImage{} = review_image, attrs) do
    review_image
    |> ReviewImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a review_image.

  ## Examples

      iex> delete_review_image(review_image)
      {:ok, %ReviewImage{}}

      iex> delete_review_image(review_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_review_image(%ReviewImage{} = review_image) do
    Repo.delete(review_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking review_image changes.

  ## Examples

      iex> change_review_image(review_image)
      %Ecto.Changeset{data: %ReviewImage{}}

  """
  def change_review_image(%ReviewImage{} = review_image, attrs \\ %{}) do
    ReviewImage.changeset(review_image, attrs)
  end

  alias Pesapie.Products.ImageLink

  @doc """
  Returns the list of imagelinks.

  ## Examples

      iex> list_imagelinks()
      [%ImageLink{}, ...]

  """
  def list_imagelinks do
    Repo.all(ImageLink)
  end

  @doc """
  Gets a single image_link.

  Raises `Ecto.NoResultsError` if the Image link does not exist.

  ## Examples

      iex> get_image_link!(123)
      %ImageLink{}

      iex> get_image_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_image_link!(id), do: Repo.get!(ImageLink, id)

  @doc """
  Creates a image_link.

  ## Examples

      iex> create_image_link(%{field: value})
      {:ok, %ImageLink{}}

      iex> create_image_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_image_link(attrs \\ %{}) do
    %ImageLink{}
    |> ImageLink.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a image_link.

  ## Examples

      iex> update_image_link(image_link, %{field: new_value})
      {:ok, %ImageLink{}}

      iex> update_image_link(image_link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_image_link(%ImageLink{} = image_link, attrs) do
    image_link
    |> ImageLink.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a image_link.

  ## Examples

      iex> delete_image_link(image_link)
      {:ok, %ImageLink{}}

      iex> delete_image_link(image_link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_image_link(%ImageLink{} = image_link) do
    Repo.delete(image_link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking image_link changes.

  ## Examples

      iex> change_image_link(image_link)
      %Ecto.Changeset{data: %ImageLink{}}

  """
  def change_image_link(%ImageLink{} = image_link, attrs \\ %{}) do
    ImageLink.changeset(image_link, attrs)
  end

  alias Pesapie.Products.ProductImage

  @doc """
  Returns the list of productimages.

  ## Examples

      iex> list_productimages()
      [%ProductImage{}, ...]

  """
  def list_productimages do
    Repo.all(ProductImage)
  end

  @doc """
  Gets a single product_image.

  Raises `Ecto.NoResultsError` if the Product image does not exist.

  ## Examples

      iex> get_product_image!(123)
      %ProductImage{}

      iex> get_product_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_image!(id), do: Repo.get!(ProductImage, id)

  @doc """
  Creates a product_image.

  ## Examples

      iex> create_product_image(product, image_link, %{field: value})
      {:ok, %ProductImage{}}

      iex> create_product_image(product, image_link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_image(product, image_link, attrs \\ %{}) do
    product
    |> Ecto.build_assoc(:productimages, imagelink_id: image_link.id)
    |> ProductImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_image.

  ## Examples

      iex> update_product_image(product_image, %{field: new_value})
      {:ok, %ProductImage{}}

      iex> update_product_image(product_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_image(%ProductImage{} = product_image, attrs) do
    product_image
    |> ProductImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product_image.

  ## Examples

      iex> delete_product_image(product_image)
      {:ok, %ProductImage{}}

      iex> delete_product_image(product_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_image(%ProductImage{} = product_image) do
    Repo.delete(product_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_image changes.

  ## Examples

      iex> change_product_image(product_image)
      %Ecto.Changeset{data: %ProductImage{}}

  """
  def change_product_image(%ProductImage{} = product_image, attrs \\ %{}) do
    ProductImage.changeset(product_image, attrs)
  end

  def data(), do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, _params), do: queryable
end
