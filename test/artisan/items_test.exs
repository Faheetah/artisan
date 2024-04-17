defmodule Artisan.ItemsTest do
  use Artisan.DataCase

  alias Artisan.Items

  describe "items" do
    alias Artisan.Items.Item

    import Artisan.ItemsFixtures

    @invalid_attrs %{class: nil, item_link: nil, name: nil, quality: nil, sell_price: nil, subclass: nil, unique_name: nil}

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{id: 1, class: "some class", item_link: "some item_link", name: "some name", quality: "some quality", sell_price: 42, subclass: "some subclass", unique_name: "some unique_name"}

      assert {:ok, %Item{} = item} = Items.create_item(valid_attrs)
      assert item.class == "some class"
      assert item.item_link == "some item_link"
      assert item.name == "some name"
      assert item.quality == "some quality"
      assert item.sell_price == 42
      assert item.subclass == "some subclass"
      assert item.unique_name == "some unique_name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "create_item/1 with duplicate unique names or IDs returns error changeset" do
      Items.create_item(%{id: 1, class: "x", item_link: "x", name: "x", quality: "x", sell_price: 1, subclass: "x", unique_name: "unique"})

      assert {:error, %Ecto.Changeset{}} = Items.create_item(%{id: 1, class: "x", item_link: "x", name: "x", quality: "x", sell_price: 1, subclass: "x", unique_name: "x"})
      assert {:error, %Ecto.Changeset{}} = Items.create_item(%{id: 2, class: "x", item_link: "x", name: "x", quality: "x", sell_price: 1, subclass: "x", unique_name: "unique"})
    end

    test "import_items/1 creates records for the listen items" do
      items = Enum.map(1..10, fn i -> %{"itemId" => i, "name" => "x", "class" => "x", "itemLink" => "x", "quality" => "x", "sellPrice" => 1, "subclass" => "x", "uniqueName" => "x-#{i}"} end)
      imports = Items.import_items(items)

      assert length(imports) == 10
      assert Enum.sort(Enum.map(imports, fn i -> i.id end)) == Enum.to_list(1..10)
    end
  end
end
