defmodule PesapieWeb.Schema.Schema do
  use Absinthe.Schema
  import_types PesapieWeb.Schema.ProductTypes

  query do

    @desc "Get all products"
    field :products, list_of(:product) do
      resolve &PesapieWeb.Resolvers.Product.list_products/3
    end

  end

end
