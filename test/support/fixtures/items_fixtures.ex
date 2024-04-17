defmodule Artisan.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Artisan.Items` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        id: 1,
        class: "some class",
        item_link: "some item_link",
        name: "some name",
        quality: "some quality",
        sell_price: 42,
        subclass: "some subclass",
        unique_name: "some unique_name"
      })
      |> Artisan.Items.create_item()

    item
  end
end
