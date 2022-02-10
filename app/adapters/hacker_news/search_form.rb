# frozen_string_literal: true

module HackerNews
  class SearchForm
    include ActiveModel::Model

    attr_accessor :tags, :query

    def initialize(attributes = {})
      @query = attributes['query']
      @tags = build_tags(attributes['tags'])
    end

    def as_search_params
      {
        tags: tags,
        query: query
      }
    end

    private

    attr_reader :attributes

    def build_tags(attr = nil)
      t = attr
      t.concat("_#{query}") if t == 'author'
      [t]
    end
  end
end
