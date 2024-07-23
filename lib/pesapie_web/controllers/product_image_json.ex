defmodule PesapieWeb.ProductImageJSON do
  alias Pesapie.Products.ProductImage

  @doc """
  Renders a list of productimages.
  """
  def index(%{productimages: productimages}) do
    %{data: for(product_image <- productimages, do: data(product_image))}
  end

  @doc """
  Renders a single product_image.
  """
  def show(%{product_image: product_image}) do
    %{data: data(product_image)}
  end

  defp data(%ProductImage{} = product_image) do
    %{
      id: product_image.id
    }
  end
end
