defmodule PesapieWeb.ImageLinkController do
  use PesapieWeb, :controller

  alias Pesapie.Products
  alias Pesapie.Product.ImageLink

  action_fallback PesapieWeb.FallbackController

  def index(conn, _params) do
    imagelinks = Products.list_imagelinks()
    render(conn, :index, imagelinks: imagelinks)
  end

  def create(conn, %{"image_link" => image_link_params}) do
    with {:ok, %ImageLink{} = image_link} <- Products.create_image_link(image_link_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/imagelinks/#{image_link}")
      |> render(:show, image_link: image_link)
    end
  end

  def show(conn, %{"id" => id}) do
    image_link = Products.get_image_link!(id)
    render(conn, :show, image_link: image_link)
  end

  def update(conn, %{"id" => id, "image_link" => image_link_params}) do
    image_link = Products.get_image_link!(id)

    with {:ok, %ImageLink{} = image_link} <-
           Products.update_image_link(image_link, image_link_params) do
      render(conn, :show, image_link: image_link)
    end
  end

  def delete(conn, %{"id" => id}) do
    image_link = Products.get_image_link!(id)

    with {:ok, %ImageLink{}} <- Products.delete_image_link(image_link) do
      send_resp(conn, :no_content, "")
    end
  end
end
