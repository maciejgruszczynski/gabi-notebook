# frozen_string_literal: true

module HackerNews
  class Adapter
    def initialize
      @url = Rails.configuration.hacker_news[:api_url]
      @query_builder = QueryBuilder
    end

    def search(params, page)
      response = do_request(params)
    end

    private
    
    attr_reader :url, :query_builder

    def do_request(params)
      RestClient::Request.execute(
        method: :get,
        url: query_url(params)
      )
    end


    def query_url(params)
      query_url = query_builder.new(params).build

      url + query_url
    end
  end
end
