# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::PurchasesController, type: :request do

  describe 'POST #purchase' do
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }
    let(:season) { create(:season) }
    let(:purchase_option) { create(:purchase_option) }

    let(:purchase_movie) { create(:purchase, :purchase_movie, content_id: movie.id ) }
    let(:purchase_season) { create(:purchase, :purchase_season, content_id: season.id ) }

    it 'purchase a movie succesfully' do
      expect { post "/api/v1/purchase?user_id=#{user.id}&content_id=#{movie.id}&content_type=Movie&purchase_option_id=#{purchase_option.id}" }.to change(Purchase, :count).by(1)
    end

    it 'purchase a season succesfully' do

      expect{purchase_season}.to change(Purchase, :count).by(1)
    end

    it 'fails when the user try to purchase a movie that is already in his library' do

      expect{purchase_movie}.to change(Purchase, :count).by(1)
      expect{ post "/api/v1/purchase?user_id=1&content_id=1&content_type=Movie&purchase_option_id=1" }.to change(Purchase, :count).by(0)
    end

    it 'allows the user to purchase an expired movie' do

      purchase_movie

      purchase = Purchase.find(purchase_movie.id)
      purchase.expiration_date = DateTime.now - 1.day
      purchase.save
      
      post "/api/v1/purchase?user_id=1&content_id=1&content_type=Movie&purchase_option_id=1" 

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['response']).to eq('The Movie has been updated in user library.')

    end

    it 'raise an error when there are missing parameters in the purchase' do
      expect  do
        post '/api/v1/purchase'
      end.to raise_error ActionController::ParameterMissing
    end
  end
end
