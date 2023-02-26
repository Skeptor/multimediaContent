# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::PurchasesController, type: :request do

  describe 'POST #purchase' do

    let(:movie) { create(:movie)}
    let(:season) { create(:season)}

    let(:purchase_movie) { create(:purchase, :purchase_movie, content_id: movie.id ) }
    let(:purchase_season) { create(:purchase, :purchase_season, content_id: season.id ) }

    it 'purchase a movie succesfully' do
      expect{purchase_movie}.to change(Purchase, :count).by(1)
    end

    it 'purchase a season succesfully' do

      expect{purchase_season}.to change(Purchase, :count).by(1)
    end

    it 'fails when the user try to purchase a movie that is already in his library' do

      expect{purchase_movie}.to change(Purchase, :count).by(1)
      expect{purchase_movie}.to change(Purchase, :count).by(0)
    end

    it 'allows the user to purchase an expired movie' do

      expect{purchase_movie}.to change(Purchase, :count).by(1)

      Purchase.first.expiration_date = DateTime.now - 1
      Purchase.first.save

      expect(Purchase.first.expiration_date.to_datetime).to be_within(0.01).of((DateTime.now + Purchase::EXPIRATION_TIME))
    end

    it 'raise an error when there are missing parameters in the purchase' do
      expect  do
        post '/api/v1/purchase'
      end.to raise_error ActionController::ParameterMissing
    end
  end
end
