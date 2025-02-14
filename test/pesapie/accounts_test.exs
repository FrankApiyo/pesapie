defmodule Pesapie.AccountsTest do
  use Pesapie.DataCase

  alias Pesapie.Accounts
  alias Pesapie.Accounts.User

  describe "users" do
    alias Pesapie.Accounts.User

    import Pesapie.AccountsFixtures

    @invalid_attrs %{email: nil, password: nil, phone: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [Map.put(user, :password, nil)]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == Map.put(user, :password, nil)
    end

    test "authenticate/2 returns user when username and password is given" do
      user_fixture = user_fixture(%{passowrd: "secretpass", username: "bob"})
      {:ok, user} = Accounts.authenticate("bob", "somesecretpassword")
      assert user == Map.put(user_fixture, :password, nil)
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        email: "some email",
        password: "some password",
        phone: "some phone",
        username: "some username"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.phone == "some phone"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        email: "some updated email",
        password: "some updated password",
        phone: "some updated phone",
        username: "some updated username"
      }

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert Map.put(user, :password, nil) == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
