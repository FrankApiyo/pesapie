defmodule Pesapie.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :name, :string
    field :price, :float
    field :stockQuantity, :integer
    field :categoryId, :id
    field :owner, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :stockQuantity])
    |> validate_required([:name, :description, :price, :stockQuantity])
  end
end
