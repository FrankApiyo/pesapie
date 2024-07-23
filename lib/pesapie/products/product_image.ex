defmodule Pesapie.Products.ProductImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "productimages" do

    field :productId, :id
    field :imageLink, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product_image, attrs) do
    product_image
    |> cast(attrs, [])
    |> validate_required([])
  end
end
