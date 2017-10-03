defmodule Microblog.Repo.Migrations.MessageBelongUser do
  use Ecto.Migration

  def change do
    alter table("messages") do
      add :user_id, references(:users), null: false
    end
  end
end
