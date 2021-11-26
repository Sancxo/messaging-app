defmodule MessagingAppWeb.PostLive.PostComponent do
  use MessagingAppWeb, :live_component

  def render(assigns) do
    ~L"""
      <div id="post-<%= @post.id %>">
      </div>
    """
  end
end
