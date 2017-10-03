defmodule Microblog.User.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.User.Follow


  schema "follow_stats" do
    field :count, :integer
    belongs_to :user, Microblog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end
