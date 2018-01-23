defmodule Guerrilla.Marketing.Ad do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guerrilla.Marketing.Ad


  schema "ads" do
    field :name, :string
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(%Ad{} = ad, attrs) do
    ad
    |> cast(attrs, [:name, :uuid])
    |> validate_required([:name, :uuid])
  end
end
