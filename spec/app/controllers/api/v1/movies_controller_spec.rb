# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::MoviesController, type: :request do
  
  describe 'POST #create' do
    let(:movie) {create(:movie) }

    it 'creates a movie successfully' do
      expect { movie }.to change(Movie, :count).by(1)
    end
  end

  describe 'GET #index' do
    let!(:movies) { create_list(:movie, 5) }

    it 'return a successful response' do
      get '/api/v1/movies'

      expect(response).to be_successful
    end

    it 'request list of all movies' do
      get '/api/v1/movies'

      expect(JSON.parse(response.body).count).to eq(5)
    end
  end

  describe 'GET #show' do
    let!(:movie) {create(:movie) }

    it 'returns the Movie object by id' do
      get "/api/v1/movies/#{movie.id}"

      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    let!(:movie) {create(:movie) }

    it 'updates the Movie information' do
      movie.title = 'Updated Title'

      put "/api/v1/movies/#{movie.id}", params: { title: movie.title }

      expect(Movie.first.title).to eq('Updated Title')
    end
  end

  describe 'DELETE #destroy' do
    let!(:movie) {create(:movie) }

    it 'deletes the movie' do
      expect {
        delete "/api/v1/movies/#{movie.id}"
      }.to change(Movie, :count).by(-1)
    end
  end
end
