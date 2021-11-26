defmodule MessagingAppWeb.PostLive.PostComponent do
  use MessagingAppWeb, :live_component

  def render(assigns) do
    ~L"""
      <div id="post-<%= @post.id %>">
        <div>
          <div>
            <div></div>
          </div>

          <div>
            <b>@<%= @post.username %></b>
            <br />
            <%= @post.message %>
          </div>
        </div>

        <div>
          <div>
            <i class="far fa-heart"></i> <%= @post.likes_count %>
          </div>

          <div>
            <i class="far fa-retweet"></i> <%= @post.reposts_count %>
          </div>

          <div>
            <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
              <i class="far fa-edit"></i>
            <% end %>
            <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure ?"] do %>

            <% end %>
          </div>
        </div>
      </div>
    """
  end
end
