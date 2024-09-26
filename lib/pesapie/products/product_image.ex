defmodule Pesapie.Products.ProductImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "productimages" do
    belongs_to :product, Pesapie.Products.Product
    belongs_to :imagelink, Pesapie.Products.ImageLink

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product_image, attrs) do
    product_image
    |> cast(attrs, [])
    |> validate_required([:imagelink_id, :product_id])
  end
end
