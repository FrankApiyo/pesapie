defmodule Pesapie.AccountTest do
  use Pesapie.DataCase

  alias Pesapie.Account

  describe "imagelinks" do
    alias Pesapie.Account.ImageLink

    import Pesapie.AccountFixtures

    @invalid_attrs %{linkURL: nil}

    test "list_imagelinks/0 returns all imagelinks" do
      image_link = image_link_fixture()
      assert Account.list_imagelinks() == [image_link]
    end

    test "get_image_link!/1 returns the image_link with given id" do
      image_link = image_link_fixture()
      assert Account.get_image_link!(image_link.id) == image_link
    end

    test "create_image_link/1 with valid data creates a image_link" do
      valid_attrs = %{linkURL: "some linkURL"}

      assert {:ok, %ImageLink{} = image_link} = Account.create_image_link(valid_attrs)
      assert image_link.linkURL == "some linkURL"
    end

    test "create_image_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_image_link(@invalid_attrs)
    end

    test "update_image_link/2 with valid data updates the image_link" do
      image_link = image_link_fixture()
      update_attrs = %{linkURL: "some updated linkURL"}

      assert {:ok, %ImageLink{} = image_link} = Account.update_image_link(image_link, update_attrs)
      assert image_link.linkURL == "some updated linkURL"
    end

    test "update_image_link/2 with invalid data returns error changeset" do
      image_link = image_link_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_image_link(image_link, @invalid_attrs)
      assert image_link == Account.get_image_link!(image_link.id)
    end

    test "delete_image_link/1 deletes the image_link" do
      image_link = image_link_fixture()
      assert {:ok, %ImageLink{}} = Account.delete_image_link(image_link)
      assert_raise Ecto.NoResultsError, fn -> Account.get_image_link!(image_link.id) end
    end

    test "change_image_link/1 returns a image_link changeset" do
      image_link = image_link_fixture()
      assert %Ecto.Changeset{} = Account.change_image_link(image_link)
    end
  end
end
