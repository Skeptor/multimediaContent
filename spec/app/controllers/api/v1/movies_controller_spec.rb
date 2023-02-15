require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::MoviesController, type: :request do
    describe 'GET #index' do
        let(:movies) { create_list(:movie, 5) }
        
        it "return a successful response" do
            get "/api/v1/movies"

            expect(response).to be_successful
        end

        it "request list of all movies" do
            get "/api/v1/movies"
            expect{ movies }.to change { Movie.count }.by(5)
        end
    end
end
