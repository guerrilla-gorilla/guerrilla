defmodule GuerrillaWeb.AdView do
  use GuerrillaWeb, :view
  alias GuerrillaWeb.AdView

  def render("index.json", %{ads: ads}) do
    %{data: render_many(ads, AdView, "ad.json")}
  end

  def render("show.json", %{ad: ad}) do
    %{data: render_one(ad, AdView, "ad.json")}
  end

  def render("ad.json", %{ad: ad}) do
    %{id: ad.id,
      name: ad.name,
      uuid: ad.uuid}
  end
end
