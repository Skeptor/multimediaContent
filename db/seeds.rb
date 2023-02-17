# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..3).each do |season_number|
    season = Season.create(title: "The Office", plot: Faker::Lorem.sentence(word_count: 5), number: season_number)
    PurchaseOption.create(video_quality: :HD, payment: season)
    PurchaseOption.create(video_quality: :SD, payment: season)
    if season.save
        season.purchase_options = PurchaseOption.all
        (1..5).each do |episode_number|
            season.episodes.create(title: "The Office: Today " + Faker::TvShows::TheOffice.character, plot: Faker::Lorem.sentence(word_count: 5), number: episode_number)
        end
    end
end

(1..10).each {
     movie = Movie.create(title: Faker::Movie.unique.title, plot: Faker::Lorem.sentence(word_count: 5))
     PurchaseOption.create(video_quality: :HD, payment: movie)
     PurchaseOption.create(video_quality: :SD, payment: movie)
}

(1..3).each do |season_number|
    season = Season.create(title: "Simpsons", plot: Faker::Lorem.sentence(word_count: 5), number: season_number)
    PurchaseOption.create(video_quality: :HD, payment: season)
    PurchaseOption.create(video_quality: :SD, payment: season)
    if season.save
        (1..5).each do |episode_number|
            season.episodes.create(title: "Episode " + Faker::TvShows::Simpsons.character, plot: Faker::Lorem.sentence(word_count: 5), number: episode_number)
        end
    end
end