defmodule PesapieWeb.ProductImageControllerTest do
  use PesapieWeb.ConnCase

  import Pesapie.ProductsFixtures

  alias Pesapie.Products.ProductImage

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all productimages", %{conn: conn} do
      conn = get(conn, ~p"/api/productimages")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product_image" do
    test "renders product_image when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/productimages", product_image: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/productimages/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/productimages", product_image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product_image" do
    setup [:create_product_image]

    test "renders product_image when data is valid", %{conn: conn, product_image: %ProductImage{id: id} = product_image} do
      conn = put(conn, ~p"/api/productimages/#{product_image}", product_image: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/productimages/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product_image: product_image} do
      conn = put(conn, ~p"/api/productimages/#{product_image}", product_image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product_image" do
    setup [:create_product_image]

    test "deletes chosen product_image", %{conn: conn, product_image: product_image} do
      conn = delete(conn, ~p"/api/productimages/#{product_image}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/productimages/#{product_image}")
      end
    end
  end

  defp create_product_image(_) do
    product_image = product_image_fixture()
    %{product_image: product_image}
  end
end
