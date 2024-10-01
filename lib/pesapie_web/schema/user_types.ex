defmodule PesapieWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  object :user do
    field :username, non_null(:string)
    field :email, non_null(:string)

    field :products, list_of(:product),
      resolve: dataloader(Product, :products, args: %{scope: :user})
  end

  object :session do
    field :user, non_null(:user)
    field :token, non_null(:string)
  end
end
