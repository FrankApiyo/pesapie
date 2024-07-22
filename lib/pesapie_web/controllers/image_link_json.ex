defmodule PesapieWeb.ImageLinkJSON do
  alias Pesapie.Account.ImageLink

  @doc """
  Renders a list of imagelinks.
  """
  def index(%{imagelinks: imagelinks}) do
    %{data: for(image_link <- imagelinks, do: data(image_link))}
  end

  @doc """
  Renders a single image_link.
  """
  def show(%{image_link: image_link}) do
    %{data: data(image_link)}
  end

  defp data(%ImageLink{} = image_link) do
    %{
      id: image_link.id,
      linkURL: image_link.linkURL
    }
  end
end
