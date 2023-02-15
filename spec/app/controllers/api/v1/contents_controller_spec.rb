require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::ContentsController, type: :request do
    describe 'GET #index' do
        it "request list of all movies and seasons" do
            Movie.create(title: "Test movie", plot: "Test")
            Season.create(title: "Test season", plot: "Test", number: 1)
            get "/api/v1/contents"
            expect(response).to be_successful
            expect(response.body).to include("Test season")
            expect(response.body).to include("Test movie")
        end
    end
end
