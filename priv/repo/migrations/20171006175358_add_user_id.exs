defmodule Microblog.Repo.Migrations.AddUserId do
  use Ecto.Migration

  def change do
    alter table("messages") do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end