# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::MoviesController, type: :request do
  describe 'GET #index' do
    let(:movies) { create_list(:movie, 5) }

    it 'return a successful response' do
      get '/api/v1/movies'

      expect(response).to be_successful
    end

    it 'request list of all movies' do
      get '/api/v1/movies'

      expect { movies }.to change { Movie.count }.by(5)
    end
  end

  describe 'GET #show' do
    let!(:movie) {create(:movie) }

    it 'returns the Movie object by id' do
      get '/api/v1/movies/', params: { id: movie.id }

      expect(response).to be_successful
    end
  end
end
