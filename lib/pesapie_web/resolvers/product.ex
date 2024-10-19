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

  def create_review(_, %{product_id: product_id} = args, %{context: %{current_user: user}}) do
    case product = Products.get_product(product_id) do
      %Products.Product{} ->
        case Products.create_review(user, product, args) do
          {:error, changeset} ->
            {:error,
             message: "Could not create review", details: ChangesetErrors.error_details(changeset)}

          {:ok, review} ->
            {:ok, review}
        end

      _ ->
        {:error, message: "The product you are reveiwing couldn't be found"}
    end
  end
end
