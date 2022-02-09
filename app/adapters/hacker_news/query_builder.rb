# frozen_string_literal: true

module HackerNews
  class QueryBuilder
    def initialize(search_params, page = nil)
      @search_params = search_params
      @page = page
    end

    def build
      search_type + query_string + tags + page_number + restrict_searchable_attributes
    end

    private

    attr_reader :search_params, :page

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

    # &page=1
    def page_number
      return '' unless page
      
      "&page=#{page}"
    end
  end
end
