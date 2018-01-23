defmodule GuerrillaWeb.AdControllerTest do
  use GuerrillaWeb.ConnCase

  alias Guerrilla.Marketing
  alias Guerrilla.Marketing.Ad

  @create_attrs %{name: "some name", uuid: "some uuid"}
  @update_attrs %{name: "some updated name", uuid: "some updated uuid"}
  @invalid_attrs %{name: nil, uuid: nil}

  def fixture(:ad) do
    {:ok, ad} = Marketing.create_ad(@create_attrs)
    ad
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ads", %{conn: conn} do
      conn = get conn, ad_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ad" do
    test "renders ad when data is valid", %{conn: conn} do
      conn = post conn, ad_path(conn, :create), ad: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, ad_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name",
        "uuid" => "some uuid"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, ad_path(conn, :create), ad: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ad" do
    setup [:create_ad]

    test "renders ad when data is valid", %{conn: conn, ad: %Ad{id: id} = ad} do
      conn = put conn, ad_path(conn, :update, ad), ad: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, ad_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name",
        "uuid" => "some updated uuid"}
    end

    test "renders errors when data is invalid", %{conn: conn, ad: ad} do
      conn = put conn, ad_path(conn, :update, ad), ad: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ad" do
    setup [:create_ad]

    test "deletes chosen ad", %{conn: conn, ad: ad} do
      conn = delete conn, ad_path(conn, :delete, ad)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, ad_path(conn, :show, ad)
      end
    end
  end

  defp create_ad(_) do
    ad = fixture(:ad)
    {:ok, ad: ad}
  end
end
