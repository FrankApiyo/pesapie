defmodule PesapieWeb.Schema.Schema do
  use Absinthe.Schema
  import_types(PesapieWeb.Schema.ProductTypes)
  import_types(PesapieWeb.Schema.UserTypes)

  query do
    @desc "Get a product by its id"
    field :product, :product do
      arg(:product_id, non_null(:string))
      resolve(&PesapieWeb.Resolvers.Product.get_product/3)
    end

    @desc "Get all products"
    field :products, list_of(:product) do
      resolve(&PesapieWeb.Resolvers.Product.list_products/3)
    end

    @desc "Get the currently signed in user"
    field :me, :user do
      resolve(&PesapieWeb.Resolvers.Accounts.me/3)
    end
  end

  mutation do
    @desc "Create a product"
    field :create_product, :product do
      arg(:description, :string)
      arg(:name, non_null(:string))
      arg(:price, :float)
      arg(:stock_quantity, :integer)
      arg(:category_id, :integer)
      middleware(Middleware.Authenticate)
      resolve(&PesapieWeb.Resolvers.Product.create_product/3)
    end

    @desc "Create a user account"
    field :signup, :session do
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:phone, non_null(:string))
      resolve(&PesapieWeb.Resolvers.Accounts.signup/3)
    end

    @desc "Sign in a user"
    field :signin, :session do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&PesapieWeb.Resolvers.Accounts.signin/3)
    end
  end
end
