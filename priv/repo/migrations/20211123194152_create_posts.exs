defmodule MessagingApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string
      add :message, :string
      add :likes_count, :integer
      add :reposts_count, :integer

      timestamps()
    end

  end
end
