require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::EpisodesController, type: :request do
    
    it "request list of all espisodes of a season" do
        @season = Season.create(title: "Test season", plot: "Test", number: 1)
        Episode.create(title: "Test espisode", plot: "Test", number: 1, season_id: @season.id)
        get "/api/v1/seasons/#{@season.id}/episodes"
        expect(response).to be_successful
        expect(response.body).to include("Test espisode")
    end
end