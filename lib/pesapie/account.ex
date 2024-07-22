defmodule Pesapie.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Pesapie.Repo

  alias Pesapie.Account.ImageLink

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
end
