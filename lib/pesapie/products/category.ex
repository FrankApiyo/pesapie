defmodule Pesapie.Products.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :categoryName, :string
    field :parentCategoryId, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:categoryName])
    |> validate_required([:categoryName])
  end
end
