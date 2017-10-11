defmodule Microblog.Repo.Migrations.LikesFields do
  use Ecto.Migration

  def change do
    alter table("likes") do
      remove :user_id
      remove :message_id
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :message_id, references(:messages, on_delete: :delete_all), null: false
    end
  end
end
