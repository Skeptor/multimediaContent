# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::EpisodesController, type: :request do

  describe 'POST #create' do
    let(:season) { create(:season) }
    let(:episode) { create(:episode, season:) }

    it 'creates a episode successfully' do
      expect { episode }.to change(Episode, :count).by(1)
    end
  end

  describe 'GET #index' do

    let!(:season) { create(:season) }
    let!(:episodes) { create_list(:episode, 5, season:) }

    it 'return a successful response' do
      get "/api/v1/seasons/#{season.id}/episodes"

      expect(response).to be_successful
    end

    it 'request list of all espisodes of a season' do
      get "/api/v1/seasons/#{season.id}/episodes"

      expect(JSON.parse(response.body).count).to eq(5)
    end
  end

  describe 'GET #show' do
    let!(:season) {create(:season) }
    let(:episode) { create(:episode, season:) }

    it 'returns the Episode object by id' do
      get "/api/v1/seasons/#{season.id}/episodes/#{episode.id}"

      expect(response).to be_successful
    end
  end

  
  describe 'PUT #update' do
    let!(:season) {create(:season) }
    let(:episode) { create(:episode, season:) }

    it 'updates the Season information' do
      episode.title = 'Updated Title'
      
      put "/api/v1/seasons/#{season.id}/episodes/#{episode.id}", params: { title: episode.title }

      expect(Episode.first.title).to eq('Updated Title')
    end
  end

  describe 'DELETE #destroy' do
    let!(:season) {create(:season) }
    let!(:episode) { create(:episode, season:) }

    it 'deletes the Episode' do
      expect {
        delete "/api/v1/seasons/#{season.id}/episodes/#{episode.id}"
      }.to change(Episode, :count).by(-1)
    end
  end

end
