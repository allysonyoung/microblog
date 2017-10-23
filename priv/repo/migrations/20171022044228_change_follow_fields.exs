defmodule Microblog.Repo.Migrations.ChangeFollowFields do
  use Ecto.Migration

  def change do
    alter table("follow_stats") do
      remove :count
      add :following_id, references(:users, on_delete: :delete_all)
    end
  end
end
