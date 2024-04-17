defmodule Artisan.Repo.Migrations.CreateRealms do
  use Ecto.Migration

  def change do
    create table(:realms) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
