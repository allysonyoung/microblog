defmodule Microblog.UserTest do
  use Microblog.DataCase

  alias Microblog.User

  describe "messages" do
    alias Microblog.User.Message

    @valid_attrs %{message: "some message", name: "some name"}
    @update_attrs %{message: "some updated message", name: "some updated name"}
    @invalid_attrs %{message: nil, name: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert User.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert User.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = User.create_message(@valid_attrs)
      assert message.message == "some message"
      assert message.name == "some name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = User.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.message == "some updated message"
      assert message.name == "some updated name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_message(message, @invalid_attrs)
      assert message == User.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = User.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> User.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = User.change_message(message)
    end
  end

  describe "follow_stats" do
    alias Microblog.User.Follow

    @valid_attrs %{count: 42}
    @update_attrs %{count: 43}
    @invalid_attrs %{count: nil}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_follow()

      follow
    end

    test "list_follow_stats/0 returns all follow_stats" do
      follow = follow_fixture()
      assert User.list_follow_stats() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert User.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = User.create_follow(@valid_attrs)
      assert follow.count == 42
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = User.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
      assert follow.count == 43
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_follow(follow, @invalid_attrs)
      assert follow == User.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = User.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> User.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = User.change_follow(follow)
    end
  end

  describe "likes" do
    alias Microblog.User.Like

    @valid_attrs %{message_id: 2, user_id: 1}
    @update_attrs %{message_id: 1, user_id: 2}
    @invalid_attrs %{message_id: nil, user_id: nil}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_like()

      like
    end

    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert User.list_likes() == [like]
    end

    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert User.get_like!(like.id) == like
    end

    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = User.create_like(@valid_attrs)
    end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_like(@invalid_attrs)
    end

    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, like} = User.update_like(like, @update_attrs)
      assert %Like{} = like
    end

    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_like(like, @invalid_attrs)
      assert like == User.get_like!(like.id)
    end

    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = User.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> User.get_like!(like.id) end
    end

    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = User.change_like(like)
    end
  end
end
