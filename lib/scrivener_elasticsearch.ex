defmodule ScrivenerElasticsearch do
  use Scrivener, page_size: 10

  defstruct _id: "", _index: "", _score: 0.0, _source: %{}, _type: ""
end


defimpl Scrivener.Paginater, for: Map do

  alias Scrivener.{Config, Page}

  @spec paginate(Map, Scrivener.Config.t) :: Scrivener.Page.t
  def paginate(es_result, %Config{page_size: page_size, page_number: page_number, module: ScrivenerElasticsearch}) do

    entries = Enum.map es_result.hits.hits, fn(v) -> struct(ScrivenerElasticsearch, v) end
    total_entries = es_result.hits.total

    %Page{
      page_size: page_size,
      page_number: page_number,
      entries: entries,
      total_entries: total_entries,
      total_pages: total_pages(total_entries, page_size)
    }
  end

  defp ceiling(float) do
    t = trunc(float)

    case float - t do
      neg when neg < 0 ->
        t
      pos when pos > 0 ->
        t + 1
      _ -> t
    end
  end

  defp total_pages(total_entries, page_size) do
    ceiling(total_entries / page_size)
  end
end
