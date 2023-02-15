require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::SeasonsController, type: :request do
    describe 'GET #index' do
        let(:seasons) { create_list(:season, 5) }

        it "return a successful response" do
            get "/api/v1/seasons"

            expect(response).to be_successful
        end

        it "request list of all seasons" do
            get "/api/v1/seasons"

            expect{ seasons }.to change { Season.count }.by(5)
        end
    end
end
