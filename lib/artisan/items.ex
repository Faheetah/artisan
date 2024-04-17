defmodule Artisan.Items do
  @moduledoc """
  The Items context.
  """

  import Ecto.Query, warn: false
  alias Artisan.Repo

  alias Artisan.Items.Item

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.
  """
  def get_item!(id) do
    Repo.get!(Item, id)
  end

  @doc """
  Creates a item.
  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Imports items from a list, for example:
  Artisan.import_data("../wow-classic-items/data/json/data.json")
  """
  def import_items(items) do
    Task.async_stream(items, fn item ->
      create_item(%{
        id: item["itemId"],
        class: item["class"],
        item_link: item["itemLink"],
        name: item["name"],
        quality: item["quality"],
        sell_price: item["sellPrice"],
        subclass: item["subclass"],
        unique_name: item["uniqueName"]
      })
    end, ordered: false)
    |> Enum.map(fn {:ok, {:ok, v}} -> v end)
  end
end
