defmodule Pesapie.Products.ImageLink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "imagelinks" do
    field :linkURL, :string
    has_one :productimage, Pesapie.Products.ProductImage
    has_one :reviewimage, Pesapie.Products.ReviewImage

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(image_link, attrs) do
    image_link
    |> cast(attrs, [:linkURL])
    |> validate_required([:linkURL])
  end
end
