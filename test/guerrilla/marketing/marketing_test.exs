defmodule Guerrilla.MarketingTest do
  use Guerrilla.DataCase

  alias Guerrilla.Marketing

  describe "ads" do
    alias Guerrilla.Marketing.Ad

    @valid_attrs %{name: "some name", uuid: "some uuid"}
    @update_attrs %{name: "some updated name", uuid: "some updated uuid"}
    @invalid_attrs %{name: nil, uuid: nil}

    def ad_fixture(attrs \\ %{}) do
      {:ok, ad} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Marketing.create_ad()

      ad
    end

    test "list_ads/0 returns all ads" do
      ad = ad_fixture()
      assert Marketing.list_ads() == [ad]
    end

    test "get_ad!/1 returns the ad with given id" do
      ad = ad_fixture()
      assert Marketing.get_ad!(ad.id) == ad
    end

    test "create_ad/1 with valid data creates a ad" do
      assert {:ok, %Ad{} = ad} = Marketing.create_ad(@valid_attrs)
      assert ad.name == "some name"
      assert ad.uuid == "some uuid"
    end

    test "create_ad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Marketing.create_ad(@invalid_attrs)
    end

    test "update_ad/2 with valid data updates the ad" do
      ad = ad_fixture()
      assert {:ok, ad} = Marketing.update_ad(ad, @update_attrs)
      assert %Ad{} = ad
      assert ad.name == "some updated name"
      assert ad.uuid == "some updated uuid"
    end

    test "update_ad/2 with invalid data returns error changeset" do
      ad = ad_fixture()
      assert {:error, %Ecto.Changeset{}} = Marketing.update_ad(ad, @invalid_attrs)
      assert ad == Marketing.get_ad!(ad.id)
    end

    test "delete_ad/1 deletes the ad" do
      ad = ad_fixture()
      assert {:ok, %Ad{}} = Marketing.delete_ad(ad)
      assert_raise Ecto.NoResultsError, fn -> Marketing.get_ad!(ad.id) end
    end

    test "change_ad/1 returns a ad changeset" do
      ad = ad_fixture()
      assert %Ecto.Changeset{} = Marketing.change_ad(ad)
    end
  end
end
