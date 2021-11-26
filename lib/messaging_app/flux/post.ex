defmodule MessagingApp.Flux.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :likes_count, :integer
    field :message, :string
    field :reposts_count, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :message, :likes_count, :reposts_count])
    |> validate_required([:username, :message, :likes_count, :reposts_count])
  end
end
