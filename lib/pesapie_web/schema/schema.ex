defmodule PesapieWeb.Schema.Schema do
  use Absinthe.Schema

  query do
    @desc "Placeholder query"
    field :placeholder, :string do
      resolve(fn _parent, _args, _resolution ->
        {:ok, "This is a placeholder response"}
      end)
    end
  end
end
