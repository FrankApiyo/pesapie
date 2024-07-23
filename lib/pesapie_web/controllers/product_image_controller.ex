defmodule PesapieWeb.ProductImageController do
  use PesapieWeb, :controller

  alias Pesapie.Products
  alias Pesapie.Products.ProductImage

  action_fallback PesapieWeb.FallbackController

  def index(conn, _params) do
    productimages = Products.list_productimages()
    render(conn, :index, productimages: productimages)
  end

  def create(conn, %{"product_image" => product_image_params}) do
    with {:ok, %ProductImage{} = product_image} <- Products.create_product_image(product_image_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/productimages/#{product_image}")
      |> render(:show, product_image: product_image)
    end
  end

  def show(conn, %{"id" => id}) do
    product_image = Products.get_product_image!(id)
    render(conn, :show, product_image: product_image)
  end

  def update(conn, %{"id" => id, "product_image" => product_image_params}) do
    product_image = Products.get_product_image!(id)

    with {:ok, %ProductImage{} = product_image} <- Products.update_product_image(product_image, product_image_params) do
      render(conn, :show, product_image: product_image)
    end
  end

  def delete(conn, %{"id" => id}) do
    product_image = Products.get_product_image!(id)

    with {:ok, %ProductImage{}} <- Products.delete_product_image(product_image) do
      send_resp(conn, :no_content, "")
    end
  end
end
