defmodule Artisan do
  @moduledoc """
  Artisan keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def import_data(file) do
    file
    |> File.read!()
    |> Jason.decode!()
    |> Artisan.Items.import_items()
  end
end
