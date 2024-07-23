defmodule PesapieWeb.ReviewImageControllerTest do
  use PesapieWeb.ConnCase

  import Pesapie.ProductsFixtures

  alias Pesapie.Products.ReviewImage

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reviewimages", %{conn: conn} do
      conn = get(conn, ~p"/api/reviewimages")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create review_image" do
    test "renders review_image when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/reviewimages", review_image: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/reviewimages/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/reviewimages", review_image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update review_image" do
    setup [:create_review_image]

    test "renders review_image when data is valid", %{conn: conn, review_image: %ReviewImage{id: id} = review_image} do
      conn = put(conn, ~p"/api/reviewimages/#{review_image}", review_image: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/reviewimages/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, review_image: review_image} do
      conn = put(conn, ~p"/api/reviewimages/#{review_image}", review_image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete review_image" do
    setup [:create_review_image]

    test "deletes chosen review_image", %{conn: conn, review_image: review_image} do
      conn = delete(conn, ~p"/api/reviewimages/#{review_image}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/reviewimages/#{review_image}")
      end
    end
  end

  defp create_review_image(_) do
    review_image = review_image_fixture()
    %{review_image: review_image}
  end
end
