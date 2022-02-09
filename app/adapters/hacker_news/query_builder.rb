# frozen_string_literal: true

module HackerNews
  class QueryBuilder
    def initialize(search_params)
      @search_params = search_params
    end

    def build
      search_type + query_string + tags + restrict_searchable_attributes
    end

    private

    attr_reader :search_params

    # i.e. 'search?'
    def search_type
      "#{search_params[:search_type]}?"
    end

    # i.e. 'tags=comment&' OR 'tags=(story,pool)'
    def tags
      tags = search_params[:tags]

      return '' unless tags.any?

      tgs = tags.join(',')
      tgs.prepend('(').concat(')') if tags.size > 1
      
      "tags=#{tgs}"
    end

    def query_string
      return '' if search_params[:query_string].empty?

      "query=#{search_params[:query_string]}&"
    end

    # i.e. restrictSearchableAttributes=url
    def restrict_searchable_attributes
      return '' if search_params[:restrict_searchable_attributes].empty?

      "restrictSearchableAttributes=#{search_params[:restrict_searchable_attributes]}"
    end
  end
end
