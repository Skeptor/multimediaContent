require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::MoviesController, type: :request do
    describe 'GET #index' do
        let!(:movies) { create_list(:movie, 5) }
        
        it "request list of all movies" do
            Movie.create(title: "Test movie", plot: "Test")
            get "/api/v1/movies"
            expect(response).to be_successful
            expect(response.body).to include("Test movie")
        end
    end
end
