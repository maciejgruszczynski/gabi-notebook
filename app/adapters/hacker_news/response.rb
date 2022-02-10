# frozen_string_literal: true

ApiResponse = Struct.new(:data, :results, :status_code) do
  def success?
    status_code.to_i.in?(200..299)
  end

  def current_page
    data.dig('page')
  end

  def previous_page
    return nil if first_page?

    current_page - 1
  end

  def next_page
    return nil if last_page?

    current_page + 1
  end

  def first_page?
    current_page == 0
  end

  def last_page?
    current_page == number_of_pages - 1
  end

  def number_of_pages
    data.dig('nbPages')
  end

  def query
    data.dig('params')
  end

  def search_params
    data.dig('params').split('&').map { |s| s.split('=') }.to_h.slice('tags', 'query')
  end

  def hits_count
    data.dig('nbHits')
  end
end

module HackerNews
  class Response
    def self.build(hn_response)
      data = JSON.parse(hn_response)
      results = data.dig('hits')
      status_code = hn_response.code

      ApiResponse.new(data, results, status_code)
    end
  end
end
