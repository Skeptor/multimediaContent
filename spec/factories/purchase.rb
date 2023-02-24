# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    user
    purchase_option

    trait :purchase_movie do
      content_type { 'Movie' }
    end

    trait :purchase_season do
      content_type { 'Season' }
    end

  end
end

