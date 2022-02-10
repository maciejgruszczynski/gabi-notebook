# frozen_string_literal: true

module HackerNews
  class QueryBuilder
    def initialize(search_params, page = nil)
      @search_params = search_params
      @page = page
    end

    def build
      'search?' + build_query
    end

    private

    attr_reader :search_params, :page

    def build_query
      return '' unless search_params

      [query_string, tags, page_number].compact.join('&')
    end

    def query_string
      return nil if search_params[:query].blank?

      "query=#{search_params[:query]}"
    end

    # i.e. 'tags=comment&' OR 'tags=(story,pool)'
    def tags
      tags = search_params[:tags]

      return nil unless tags.any?

      tgs = tags.join(',')
      tgs.prepend('(').concat(')') if tags.size > 1

      "tags=#{tgs}"
    end

    # &page=1
    def page_number
      return nil unless page

      "page=#{page}"
    end
  end
end
