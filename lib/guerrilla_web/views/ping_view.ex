defmodule GuerrillaWeb.PingView do
  use GuerrillaWeb, :view
  alias GuerrillaWeb.PingView

  def render("ping.json", _params) do
    %{data: %{:message => :pong}}
  end
end
