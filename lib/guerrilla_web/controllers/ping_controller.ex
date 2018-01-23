defmodule GuerrillaWeb.PingController do
  use GuerrillaWeb, :controller

  action_fallback GuerrillaWeb.FallbackController

  def ping(conn, _params) do
    render(conn, "ping.json", %{})
  end
end
