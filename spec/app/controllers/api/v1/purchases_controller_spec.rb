require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::PurchasesController, type: :request do
    let(:movie) { create(:movie) }
    let(:season) { create(:season) }
    let(:user) { create(:user) }

    describe 'POST #purchase' do
        it "purchase a movie succesfully" do
            post "/api/v1/purchase/?user_id=#{user.id}&movie_id=#{movie.id}&content_type=Movie&video_quality=1"

            expect(response).to be_successful
        end

        it "purchase a season succesfully" do
            post "/api/v1/purchase/?user_id=#{user.id}&season_id=#{season.id}=1&content_type=Season&video_quality=0"

            expect(response).to be_successful
        end

        it "fails when the user try to purchase a movie that is already in his library" do
            post "/api/v1/purchase/?user_id=#{user.id}&movie_id=#{movie.id}&content_type=Movie&video_quality=1"
            expect(response).to be_successful
            
            post "/api/v1/purchase/?user_id=#{user.id}&movie_id=#{movie.id}&content_type=Movie&video_quality=1"
            expect(response).not_to be_successful
        end
    end
end
