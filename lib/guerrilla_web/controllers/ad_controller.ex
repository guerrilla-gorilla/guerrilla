defmodule GuerrillaWeb.AdController do
  use GuerrillaWeb, :controller

  # notice the context `Marketing' here
  alias Guerrilla.Marketing
  alias Guerrilla.Marketing.Ad

  action_fallback GuerrillaWeb.FallbackController

  def index(conn, _params) do
    ads = Marketing.list_ads()
    render(conn, "index.json", ads: ads)
  end

  def create(conn, %{"ad" => ad_params}) do
    with {:ok, %Ad{} = ad} <- Marketing.create_ad(ad_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ad_path(conn, :show, ad))
      |> render("show.json", ad: ad)
    end
  end

  def show(conn, %{"id" => id}) do
    ad = Marketing.get_ad!(id)
    render(conn, "show.json", ad: ad)
  end

  def update(conn, %{"id" => id, "ad" => ad_params}) do
    ad = Marketing.get_ad!(id)

    with {:ok, %Ad{} = ad} <- Marketing.update_ad(ad, ad_params) do
      render(conn, "show.json", ad: ad)
    end
  end

  def delete(conn, %{"id" => id}) do
    ad = Marketing.get_ad!(id)
    with {:ok, %Ad{}} <- Marketing.delete_ad(ad) do
      send_resp(conn, :no_content, "")
    end
  end
end
