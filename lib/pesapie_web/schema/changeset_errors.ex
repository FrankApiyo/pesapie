defmodule PesapieWeb.Schema.ChangesetErrors do
  @doc """
    Traverse the changeset errors and return a map of
    error messages. For example:

    %{start_date: "Can't be blank", end_date: "can't be blank"}
  """

  def error_details(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
