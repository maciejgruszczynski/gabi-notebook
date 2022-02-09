# frozen_string_literal: true

FactoryBot.define do
  factory :search_notebook do
    sequence(:title) do |n|
      "title_#{n}"
    end
  end
end
