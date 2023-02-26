# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::SeasonsController, type: :request do

  describe 'POST #create' do
    it 'creates a season successfully' do
      expect { post '/api/v1/seasons?title=Test&plot=Test&number=1' }.to change(Season, :count).by(1)
    end
  end

  describe 'GET #index' do
    let!(:seasons) { create_list(:season, 5) }

    it 'return a successful response' do
      get '/api/v1/seasons'

      expect(response).to be_successful
    end

    it 'request list of all seasons' do
      get '/api/v1/seasons'

      expect(JSON.parse(response.body).count).to eq(5)
    end
  end
  
  describe 'GET #show' do
    let!(:season) {create(:season) }

    it 'returns the Season object by id' do
      get "/api/v1/seasons/#{season.id}"

      expect(response).to be_successful
    end

    it 'returns an error if the Season id does not exists' do
      expect do
        get "/api/v1/seasons/-1"
      end.to raise_error
    end
  end

  
  describe 'PUT #update' do
    let!(:season) {create(:season) }

    it 'updates the Season information' do
      season.title = 'Updated Title'
      
      put "/api/v1/seasons/#{season.id}", params: { title: season.title }

      expect(Season.first.title).to eq('Updated Title')
    end

    it 'does not updates information if Season does not exists' do
      season.title = 'Updated Title'
      
      expect do
        put "/api/v1/seasons/-1", params: { title: season.title }
      end.to raise_error
    end
  end

  describe 'DELETE #destroy' do
    let!(:season) {create(:season) }
    let!(:episodes) { create_list(:episode, 5, season:) }

    it 'deletes the Season' do
      expect {
        delete "/api/v1/seasons/#{season.id}"
      }.to change(Season, :count).by(-1)
    end

    it 'deletes all the episodes of a Season' do
      expect {
        delete "/api/v1/seasons/#{season.id}"
      }.to change(Episode, :count).by(-5)
    end
  end
end
