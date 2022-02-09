# frozen_string_literal: true

module HackerNews
  class Adapter
    def initialize
      @url = Rails.configuration.hacker_news[:api_url]
      @query_builder = QueryBuilder
      @response_builder = Response
    end

    def search(params, page)
      response_builder.build(do_request(params, page))
    end

    private
    
    attr_reader :url, :query_builder, :response_builder

    def do_request(params, page)
      RestClient::Request.execute(
        method: :get,
        url: query_url(params, page)
      )
    end

    def query_url(params, page)
      query_url = query_builder.new(params, page).build

      url + query_url
    end
  end
end
