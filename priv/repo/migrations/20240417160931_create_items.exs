defmodule Artisan.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :class, :string
      add :subclass, :string
      add :sell_price, :integer
      add :quality, :string
      add :item_link, :string
      add :unique_name, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:items, :unique_name)
  end
end
