# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::PurchasesController, type: :request do

  describe 'GET #library' do
    let(:user) { create(:user) }
    let(:movie) { create(:movie)}
    let(:season) { create(:season)}

    let!(:purchase_movie) { create(:purchase, :purchase_movie, user: user, content_id: movie.id ) }
    let!(:purchase_season) { create(:purchase, :purchase_season, user: user, content_id: season.id ) }

    it "returns the user's library filtering expired movies" do
        purchase_season.expiration_date = DateTime.now - 1
        purchase_season.save

        get "/api/v1/users/#{user.id}/library"
        
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.count).to eq(1)
    end
  end

end