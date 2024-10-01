defmodule PesapieWeb.Resolvers.Product do
  alias Pesapie.Products
  alias PesapieWeb.Schema.ChangesetErrors

  def list_products(_parent, _args, _resolution) do
    {:ok, Products.list_products()}
  end

  def get_product(_parent, %{product_id: product_id}, _resolution) do
    with {id, _} <- Integer.parse(product_id),
         %{} = product <- Products.get_product!(id) do
      {:ok, product}
    else
      _ -> {:error, message: "#{product_id} is not a valid product id"}
    end
  end

  def create_product(_, args, %{context: %{current_user: user}}) do
    case Products.create_product(user, args) do
      {:error, changeset} ->
        {:error,
         message: "Could not create product", details: ChangesetErrors.error_details(changeset)}

      {:ok, product} ->
        {:ok, product}
    end
  end
end
