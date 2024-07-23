defmodule PesapieWeb.ReviewImageController do
  use PesapieWeb, :controller

  alias Pesapie.Products
  alias Pesapie.Products.ReviewImage

  action_fallback PesapieWeb.FallbackController

  def index(conn, _params) do
    reviewimages = Products.list_reviewimages()
    render(conn, :index, reviewimages: reviewimages)
  end

  def create(conn, %{"review_image" => review_image_params}) do
    with {:ok, %ReviewImage{} = review_image} <- Products.create_review_image(review_image_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/reviewimages/#{review_image}")
      |> render(:show, review_image: review_image)
    end
  end

  def show(conn, %{"id" => id}) do
    review_image = Products.get_review_image!(id)
    render(conn, :show, review_image: review_image)
  end

  def update(conn, %{"id" => id, "review_image" => review_image_params}) do
    review_image = Products.get_review_image!(id)

    with {:ok, %ReviewImage{} = review_image} <- Products.update_review_image(review_image, review_image_params) do
      render(conn, :show, review_image: review_image)
    end
  end

  def delete(conn, %{"id" => id}) do
    review_image = Products.get_review_image!(id)

    with {:ok, %ReviewImage{}} <- Products.delete_review_image(review_image) do
      send_resp(conn, :no_content, "")
    end
  end
end
