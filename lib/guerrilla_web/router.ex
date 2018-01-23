defmodule GuerrillaWeb.Router do
  use GuerrillaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GuerrillaWeb do
    pipe_through :api

    get "/ping", PingController, :ping
    resources "/ads", AdController, except: [:new, :edit]
  end
end
