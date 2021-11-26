defmodule MessagingApp.Flux.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :username, :string, default: "Simon"
    field :message, :string
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:message])
    |> validate_required([:message])
    |> validate_length(:message, min: 1, max: 250)
  end
end
