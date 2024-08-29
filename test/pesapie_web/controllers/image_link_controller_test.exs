defmodule PesapieWeb.ImageLinkControllerTest do
  use PesapieWeb.ConnCase

  import Pesapie.AccountsFixtures
  import Pesapie.ProductsFixtures

  alias Pesapie.Product.ImageLink

  @create_attrs %{
    linkURL: "some linkURL"
  }
  @update_attrs %{
    linkURL: "some updated linkURL"
  }
  @invalid_attrs %{linkURL: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all imagelinks", %{conn: conn} do
      conn = get(conn, ~p"/api/imagelinks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create image_link" do
    test "renders image_link when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/imagelinks", image_link: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/imagelinks/#{id}")

      assert %{
               "id" => ^id,
               "linkURL" => "some linkURL"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/imagelinks", image_link: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update image_link" do
    setup [:create_image_link]

    test "renders image_link when data is valid", %{conn: conn, image_link: %ImageLink{id: id} = image_link} do
      conn = put(conn, ~p"/api/imagelinks/#{image_link}", image_link: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/imagelinks/#{id}")

      assert %{
               "id" => ^id,
               "linkURL" => "some updated linkURL"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, image_link: image_link} do
      conn = put(conn, ~p"/api/imagelinks/#{image_link}", image_link: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete image_link" do
    setup [:create_image_link]

    test "deletes chosen image_link", %{conn: conn, image_link: image_link} do
      conn = delete(conn, ~p"/api/imagelinks/#{image_link}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/imagelinks/#{image_link}")
      end
    end
  end

  defp create_image_link(_) do
    image_link = image_link_fixture()
    %{image_link: image_link}
  end
end
