# frozen_string_literal: true

class SearchResultsController < ApplicationController
  def create
    form = SearchResultForm.new(search_result_params)
    CreateSearchResult.new.call(form)
  end

  def search_result_params
    params.require(:search_result_form).permit(:title, :author, :karma_points, :created_at, :tags, :query,
                                               :search_notebook_id, :hits_count)
  end
end
