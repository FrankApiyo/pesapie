defmodule Pesapie.Products.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :comment, :string
    field :rating, :integer
    belongs_to :user, Pesapie.Accounts.User
    belongs_to :product, Pesapie.Products.Product
    has_many :reviewimages, Pesapie.Products.ReviewImage

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:rating, :comment])
    |> validate_required([:rating, :comment])
  end
end
