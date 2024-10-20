defmodule PesapieWeb.Router do
  use PesapieWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug PesapieWeb.Plugs.SetCurrentUser
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: PesapieWeb.Schema.Schema,
      analyze_complexity: true,
      max_complexity: 50

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: PesapieWeb.Schema.Schema
    # socket: PesapieWeb.UserSocket
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:pesapie, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: PesapieWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
