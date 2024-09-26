defmodule Pesapie.Products.ReviewImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviewimages" do
    belongs_to :review, Pesapie.Products.Review
    belongs_to :imagelink, Pesapie.Products.ImageLink

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review_image, attrs) do
    review_image
    |> cast(attrs, [])
    |> validate_required([:imagelink_id, :review_id])
  end
end
