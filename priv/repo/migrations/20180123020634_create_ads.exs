defmodule Guerrilla.Repo.Migrations.CreateAds do
  use Ecto.Migration

  def change do
    create table(:ads) do
      add :name, :string
      add :uuid, :string

      timestamps()
    end

  end
end
