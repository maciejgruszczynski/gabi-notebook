# frozen_string_literal: true

class SearchResultForm
  include ActiveModel::Model

  attr_accessor :title, :author, :karma_points, :created_at, :tags, :query, :search_notebook_id, :hits_count

  def initialize(attributes = {})
    @title = attributes['title']
    @author = attributes['author']
    @karma_points = attributes['karma_points']
    @created_at = attributes['created_at']
    @tags =  attributes['tags']
    @search_notebook_id = attributes['search_notebook_id']
    @hits_count = attributes['hits_count']
    @query = attributes['query']
  end
end
