defmodule Artisan.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :class, :string
    field :item_link, :string
    field :name, :string
    field :quality, :string
    field :sell_price, :integer
    field :subclass, :string
    field :unique_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:id, :name, :class, :subclass, :sell_price, :quality, :item_link, :unique_name])
    |> validate_required([:id, :name, :class, :subclass, :sell_price, :quality, :item_link, :unique_name])
    |> unique_constraint(:id, name: "items_pkey") # because we are expected to set :id
    |> unique_constraint(:unique_name)
  end
end
