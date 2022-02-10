# frozen_string_literal: true

class SearchNotebook < ApplicationRecord
  has_many :search_results

  validates :title, presence: true
end
