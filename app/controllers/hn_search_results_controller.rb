class HnSearchResultsController < ApplicationController
  include Pagy::Backend

  def index

    page = params[:page_id]
    query = {search_type: 'search', query_string: 'foo', tags: [], restrict_searchable_attributes:'' }


    @hn_search_results = HackerNews::Adapter.new.search(query, 1)
  end

  def search
    
    # binding.pry
    
    query = {search_type: 'search', query_string: 'foo', tags: [], restrict_searchable_attributes:'' }

    @hn_search_results = HackerNews::Adapter.new.search(query, params[:page])

    respond_to do |format|
      format.turbo_stream
    end
  end
end
