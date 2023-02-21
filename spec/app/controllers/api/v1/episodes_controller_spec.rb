require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::EpisodesController, type: :request do
    let(:season) { create(:season) }
    let(:episodes) { create_list(:episode, 5, season: season)}

    describe 'GET #index' do
        
        it "return a successful response" do
            get "/api/v1/seasons/#{season.id}/episodes"

            expect(response).to be_successful
        end

        it "request list of all espisodes of a season" do
            get "/api/v1/seasons/#{season.id}/episodes"
            
            expect{ episodes }.to change { Episode.count }.by(5)
        end
    end
end
