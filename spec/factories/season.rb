# frozen_string_literal: true

FactoryBot.define do
  factory :season do
    title { 'The Office' }
    plot { Faker::Lorem.sentence(word_count: 5) }
    sequence(:number)
  end
end
