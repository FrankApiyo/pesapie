defmodule PesapieWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: PesapieWeb.Schema.Schema
  alias PesapieWeb.Schema.Schema

  ## Channels
  # channel "room:*", PesapieWeb.RoomChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(params, socket, _connect_info) do
    current_user = current_user(params)

    socket =
      Absinthe.Phoenix.Socket.put_options(socket,
        context: %{
          current_user: current_user
        }
      )

    {:ok, socket}
  end

  defp current_user(%{"Authorization" => authorization}) do
    Schema.get_user_from_authorization_header_value(authorization)
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     PesapieWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
