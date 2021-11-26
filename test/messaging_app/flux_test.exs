defmodule MessagingApp.FluxTest do
  use MessagingApp.DataCase

  alias MessagingApp.Flux

  describe "posts" do
    alias MessagingApp.Flux.Post

    @valid_attrs %{likes_count: 42, message: "some message", reposts_count: 42, username: "some username"}
    @update_attrs %{likes_count: 43, message: "some updated message", reposts_count: 43, username: "some updated username"}
    @invalid_attrs %{likes_count: nil, message: nil, reposts_count: nil, username: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Flux.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Flux.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Flux.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Flux.create_post(@valid_attrs)
      assert post.likes_count == 42
      assert post.message == "some message"
      assert post.reposts_count == 42
      assert post.username == "some username"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Flux.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Flux.update_post(post, @update_attrs)
      assert post.likes_count == 43
      assert post.message == "some updated message"
      assert post.reposts_count == 43
      assert post.username == "some updated username"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Flux.update_post(post, @invalid_attrs)
      assert post == Flux.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Flux.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Flux.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Flux.change_post(post)
    end
  end
end
