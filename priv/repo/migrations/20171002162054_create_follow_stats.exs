defmodule Microblog.Repo.Migrations.CreateFollowStats do
  use Ecto.Migration

  def change do
    create table(:follow_stats) do
      add :count, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:follow_stats, [:user_id])
  end
end
