defmodule Pesapie.Products.ReviewImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviewimages" do

    field :reviewId, :id
    field :imageLink, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review_image, attrs) do
    review_image
    |> cast(attrs, [])
    |> validate_required([])
  end
end
