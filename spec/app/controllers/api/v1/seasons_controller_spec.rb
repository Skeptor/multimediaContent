require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::SeasonsController, type: :request do
    describe 'GET #index' do
        it "request list of all seasons" do
            Season.create(title: "Test season", plot: "Test", number: 1)
            get "/api/v1/seasons"
            expect(response).to be_successful
            expect(response.body).to include("Test season")
        end
    end
end
