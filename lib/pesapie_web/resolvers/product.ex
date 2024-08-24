defmodule PesapieWeb.Resolvers.Product do
  alias Pesapie.Products
  def list_products(_parent, _args, _resolution) do
    {:ok, Products.list_products()}
  end
end
