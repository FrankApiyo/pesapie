defmodule PesapieWeb.Schema.ProductTypes do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :review do
    field :comment, :string
    field :rating, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :user, :user do
      resolve(dataloader(Pesapie.Accounts))
    end

    field :product, :product do
      resolve(dataloader(Pesapie.Products))
    end

    # field :review_images, list_of(:review_images) do
    #   resolve(dataloader(Pesapie.Products))
    # end
  end

  object :product do
    field :id, :id
    field :description, :string
    field :name, :string
    field :price, :float
    field :category_id, :id
    field(:reviews, list_of(:review), resolve: dataloader(Pesapie.Products))
    # field(:productimages, list_of(:product_image), resolve: dataloader(Pesapie.Products))

    field :user, :user do
      resolve(dataloader(Pesapie.Accounts))
    end
  end
end
