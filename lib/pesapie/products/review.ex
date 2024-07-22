defmodule Pesapie.Products.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :comment, :string
    field :rating, :integer
    field :userId, :id
    field :productId, :id
    field :imagelinks, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:rating, :comment])
    |> validate_required([:rating, :comment])
  end
end
