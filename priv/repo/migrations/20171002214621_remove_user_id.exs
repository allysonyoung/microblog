defmodule Microblog.Repo.Migrations.RemoveUserId do
  use Ecto.Migration

  def change do
    alter table("messages") do
      remove :user_id
    end
  end
end
