# frozen_string_literal: true

class SearchNotebook < ApplicationRecord
  validates :title, presence: true
end
