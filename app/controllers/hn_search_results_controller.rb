# frozen_string_literal: true

class HnSearchResultsController < ApplicationController
  include Pagy::Backend

  def index
    @form = HackerNews::SearchForm.new({ 'tags' => params[:tags], 'query' => params[:query] })
    @search_result_form = SearchResultForm.new
    @hn_search_results = HackerNews::Adapter.new.search(@form.as_search_params, params[:page])
  end

  def search
    form = HackerNews::SearchForm.new(params[:hacker_news_search_form])
    @hn_search_results = HackerNews::Adapter.new.search(form.as_search_params, params[:page])
    @search_result_form = SearchResultForm.new

    respond_to do |format|
      format.turbo_stream
    end
  end
end
