defmodule Pesapie.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :name, :string
    field :price, :float
    field :stock_quantity, :integer
    field :category_id, :id

    belongs_to :user, Pesapie.Accounts.User
    has_many :productimages, Pesapie.Products.ProductImage
    has_many :reviews, Pesapie.Products.Review

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :stock_quantity])
    |> validate_required([:name, :description, :price, :stock_quantity])
  end
end
