defmodule PesapieWeb.Schema.Schema do
  use Absinthe.Schema
  import_types(PesapieWeb.Schema.ProductTypes)

  query do
    @desc "Get a product by its id"
    field :product, :product do
      arg :product_id, non_null(:string)
      resolve &PesapieWeb.Resolvers.Product.get_product/3
    end

    @desc "Get all products"
    field :products, list_of(:product) do
      resolve(&PesapieWeb.Resolvers.Product.list_products/3)
    end

    @desc "Get the currently signed in user"
    field :me, :user do
      resolve(&Resolvers.Accounts.me/3)
    end
  end

  object :user do
    field :username, non_null(:string)
  end
end
