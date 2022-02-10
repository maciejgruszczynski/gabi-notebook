# frozen_string_literal: true

class CreateSearchResult
  def initialize; end

  def call(form)
    notebook = SearchNotebook.find(form.search_notebook_id)

    search_result = SearchResult.new(
      author: form.author,
      karma_points: form.karma_points,
      creation_date: form.created_at,
      tags: form.tags
    )

    notebook.search_results << search_result

    search_result.create_search_query(query: form.query, hits_count: form.hits_count)
  end
end
