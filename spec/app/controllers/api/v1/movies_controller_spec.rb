require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::MoviesController, type: :request do
    
    it "request list of all movies" do
        Movie.create(title: "Test movie", plot: "Test")
        get "/api/v1/movies"
        expect(response).to be_successful
        expect(response.body).to include("Test movie")
    end
end