# frozen_string_literal: true

class SearchResult < ApplicationRecord
  belongs_to :search_notebook
  has_one :search_query
end
