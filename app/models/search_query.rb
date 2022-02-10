# frozen_string_literal: true

class SearchQuery < ApplicationRecord
  has_many :search_results
end
