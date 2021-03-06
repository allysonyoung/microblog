defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Accounts
  alias Microblog.User
  alias Microblog.User.Follow

  def index(conn, _params) do
    follow_stats = User.list_follow_stats()
    render(conn, "index.html", follow_stats: follow_stats)
  end

  def new(conn, _params) do
    changeset = User.change_follow(%Follow{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"follow" => follow_params}) do
    case User.create_follow(follow_params) do
      {:ok, follow} ->
        following_user = Accounts.get_user!(follow.following_id)

        conn
        |> put_flash(:info, "Follow created successfully.")
        |> redirect(to: user_path(conn, :show, following_user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = User.get_follow!(id)
    render(conn, "show.html", follow: follow)
  end

  def edit(conn, %{"id" => id}) do
    follow = User.get_follow!(id)
    changeset = User.change_follow(follow)
    render(conn, "edit.html", follow: follow, changeset: changeset)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = User.get_follow!(id)

    case User.update_follow(follow, follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow updated successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follow: follow, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = User.get_follow!(id)
    {:ok, _follow} = User.delete_follow(follow)

    conn
    |> put_flash(:info, "Follow deleted successfully.")
    |> redirect(to: follow_path(conn, :index))
  end
end
