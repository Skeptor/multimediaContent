# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.unique.title }
    plot { Faker::Lorem.sentence(word_count: 5) }
  end
end
