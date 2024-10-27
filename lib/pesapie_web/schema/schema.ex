defmodule PesapieWeb.Schema.Schema do
  use Absinthe.Schema
  alias Pesapie.Products
  alias Pesapie.Accounts

  alias PesapieWeb.Schema.Middleware
  import_types(PesapieWeb.Schema.ProductTypes)
  import_types(PesapieWeb.Schema.UserTypes)
  import_types(Absinthe.Plug.Types)

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
    @desc "Upload an image"
    field :upload_file, :string do
      arg(:image_file, non_null(:upload))

      resolve(fn args, _ ->
        IO.inspect(args.image_file)
        {:ok, "success"}
      end)
    end

    @desc "Create a review"
    field :create_review, :review do
      arg(:comment, :string)
      arg(:rating, :integer)
      arg(:product_id, :integer)
      middleware(Middleware.Authenticate)
      resolve(&PesapieWeb.Resolvers.Product.create_review/3)
    end

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

  subscription do
    field :review_added, :review do
      arg(:product_id, non_null(:id))

      # The topic function is used to determine what topic the subscription
      # cares about based on it's arguments.
      config(fn args, _ ->
        IO.inspect("hapa??")
        IO.inspect(args.product_id)
        {:ok, topic: args.product_id}
      end)

      # Run any subscription with this field every time the :create_review mutation happens
      trigger(:create_review,
        topic: fn review ->
          IO.inspect("pale?")
          IO.inspect(review.product_id)
          review.product_id
        end
      )

      resolve(fn review, _, _ ->
        # The subscription resolvers receive whatever value triggers the subscription
        {:ok, review}
      end)
    end
  end

  # Add dataloader to the context
  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Products, Products.data())
      |> Dataloader.add_source(Accounts, Accounts.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  def get_user_from_authorization_header_value(authorization_header_value) do
    with ["Bearer " <> token] <- authorization_header_value,
         {:ok, %{id: id}} <- PesapieWeb.AuthToken.verify(token),
         %{} = user <- Pesapie.Accounts.get_user(id) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
