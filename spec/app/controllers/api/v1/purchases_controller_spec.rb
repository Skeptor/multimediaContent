require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::PurchasesController, type: :request do
    let(:movie) { create(:movie) }
    let(:season) { create(:season) }
    let(:user) { create(:user) }

    describe 'POST #purchase' do
        let(:movie_params) { 
            {user_id: user.id,
            content_id: movie.id,
            content_type: "Movie",
            video_quality: 1
            }
        }
        let(:season_params) { 
            {user_id: user.id,
            content_id: season.id,
            content_type: "Season",
            video_quality: 1
            }
        }
        let(:purchase_movie){post "/api/v1/purchase", params: movie_params}
        let(:purchase_season){post "/api/v1/purchase", params: season_params}

        it "purchase a movie succesfully" do
            purchase_movie

            expect(response).to be_successful
        end

        it "purchase a season succesfully" do
            purchase_season

            expect(response).to be_successful
        end

        it "fails when the user try to purchase a movie that is already in his library" do
            purchase_movie
            expect(response).to be_successful
            
            purchase_movie
            expect(response.status).to eq 400
            expect(JSON.parse(response.body)["error"]).to eq("The Movie is alive in the user library.")

        end

        it "raise an error when there are missing parameters in the purchase" do
            expect{
                post "/api/v1/purchase"
            }.to raise_error ActionController::ParameterMissing
        end
    end
end
