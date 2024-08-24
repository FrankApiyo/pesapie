defmodule PesapieWeb.Schema.ProductTypes do
  use Absinthe.Schema.Notation

  object :product do
    field :description, :string
    field :name, :string
    field :price, :float
    field :category_id, :id
    field :owner, :id
  end
end
