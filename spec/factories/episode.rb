FactoryBot.define do
    factory :episode do
        title { "The Office" }
        plot { Faker::Lorem.sentence(word_count: 5) }
        sequence(:number)
        association :season
    end
end