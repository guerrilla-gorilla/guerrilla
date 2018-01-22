defmodule GuerrillaWeb.Router do
  use GuerrillaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    get 'ping', PingController, :ping
  end

  scope "/api", GuerrillaWeb do
    pipe_through :api
  end
end
