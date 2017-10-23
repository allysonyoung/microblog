defmodule Microblog.User do
  @moduledoc """
  The User context.
  """

  import Ecto.Query, warn: false
  alias Microblog.Repo

  alias Microblog.User.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages do
    Repo.all(Message)
  end

  def list_user_messages(user_id) do
    Repo.all(from m in Message, where: m.user_id == ^user_id)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{source: %Message{}}

  """
  def change_message(%Message{} = message) do
    Message.changeset(message, %{})
  end

  alias Microblog.User.Follow

  @doc """
  Returns the list of follow_stats.

  ## Examples

      iex> list_follow_stats()
      [%Follow{}, ...]

  """
  def list_follow_stats do
    Repo.all(Follow)
  end

  def list_user_follows(user_id) do
    Repo.all(from f in Follow, where: f.user_id == ^user_id)
  end

  @doc """
  Gets a single follow.

  Raises `Ecto.NoResultsError` if the Follow does not exist.

  ## Examples

      iex> get_follow!(123)
      %Follow{}

      iex> get_follow!(456)
      ** (Ecto.NoResultsError)

  """
  def get_follow!(id), do: Repo.get!(Follow, id)

  @doc """
  Creates a follow.

  ## Examples

      iex> create_follow(%{field: value})
      {:ok, %Follow{}}

      iex> create_follow(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_follow(attrs \\ %{}) do
    %Follow{}
    |> Follow.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a follow.

  ## Examples

      iex> update_follow(follow, %{field: new_value})
      {:ok, %Follow{}}

      iex> update_follow(follow, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_follow(%Follow{} = follow, attrs) do
    follow
    |> Follow.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Follow.

  ## Examples

      iex> delete_follow(follow)
      {:ok, %Follow{}}

      iex> delete_follow(follow)
      {:error, %Ecto.Changeset{}}

  """
  def delete_follow(%Follow{} = follow) do
    Repo.delete(follow)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking follow changes.

  ## Examples

      iex> change_follow(follow)
      %Ecto.Changeset{source: %Follow{}}

  """
  def change_follow(%Follow{} = follow) do
    Follow.changeset(follow, %{})
  end

  alias Microblog.User.Like

  @doc """
  Returns the list of likes.

  ## Examples

      iex> list_likes()
      [%Like{}, ...]

  """
  def list_likes do
    Repo.all(Like)
    |> Repo.preload(:user)
  end

  def list_message_likes(message_id) do
    Repo.all(from l in Like, where: l.message_id == ^message_id)
    |> Repo.preload(:user)
  end
  @doc """
  Gets a single like.

  Raises `Ecto.NoResultsError` if the Like does not exist.

  ## Examples

      iex> get_like!(123)
      %Like{}

      iex> get_like!(456)
      ** (Ecto.NoResultsError)

  """
  def get_like!(id) do
    Repo.get!(Like, id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a like.

  ## Examples

      iex> create_like(%{field: value})
      {:ok, %Like{}}

      iex> create_like(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_like(attrs \\ %{}) do
    %Like{}
    |> Like.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a like.

  ## Examples

      iex> update_like(like, %{field: new_value})
      {:ok, %Like{}}

      iex> update_like(like, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_like(%Like{} = like, attrs) do
    like
    |> Like.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Like.

  ## Examples

      iex> delete_like(like)
      {:ok, %Like{}}

      iex> delete_like(like)
      {:error, %Ecto.Changeset{}}

  """
  def delete_like(%Like{} = like) do
    Repo.delete(like)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking like changes.

  ## Examples

      iex> change_like(like)
      %Ecto.Changeset{source: %Like{}}

  """
  def change_like(%Like{} = like) do
    Like.changeset(like, %{})
  end
end
