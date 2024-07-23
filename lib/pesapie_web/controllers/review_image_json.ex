defmodule PesapieWeb.ReviewImageJSON do
  alias Pesapie.Products.ReviewImage

  @doc """
  Renders a list of reviewimages.
  """
  def index(%{reviewimages: reviewimages}) do
    %{data: for(review_image <- reviewimages, do: data(review_image))}
  end

  @doc """
  Renders a single review_image.
  """
  def show(%{review_image: review_image}) do
    %{data: data(review_image)}
  end

  defp data(%ReviewImage{} = review_image) do
    %{
      id: review_image.id
    }
  end
end
