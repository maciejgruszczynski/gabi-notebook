# frozen_string_literal: true

FactoryBot.define do
  factory :search_notebook do
    title { Faker::Lorem.words }
  end
end
