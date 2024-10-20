# Adds an Absinthe execution context to the Phoenix connection.
# If a valid auth token is in the request header, the corresponding
# user is added to the contrext which is then available to all
# resolvers. Otherwise, the context is empty
#
# This plug runs prior to `Absinthe.Plug` in the `:api` router
# so that the contxt is set up and `Absinthe.Plug` can extract
# the context from the connection.

defmodule PesapieWeb.Plugs.SetCurrentUser do
  @behaviour Plug

  import Plug.Conn
  alias PesapieWeb.Schema.Schema

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  def build_context(conn) do
    Schema.get_user_from_authorization_header_value(get_req_header(conn, "authorization"))
  end
end
