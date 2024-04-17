defmodule Artisan.RealmsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Artisan.Realms` context.
  """

  @doc """
  Generate a realm.
  """
  def realm_fixture(attrs \\ %{}) do
    {:ok, realm} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Artisan.Realms.create_realm()

    realm
  end
end
