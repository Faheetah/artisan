defmodule Artisan.Realms.Realm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "realms" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(realm, attrs) do
    realm
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
