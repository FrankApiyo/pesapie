defmodule Pesapie.Account.ImageLink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "imagelinks" do
    field :linkURL, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(image_link, attrs) do
    image_link
    |> cast(attrs, [:linkURL])
    |> validate_required([:linkURL])
  end
end
