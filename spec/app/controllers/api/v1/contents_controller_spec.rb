# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

describe Api::V1::ContentsController, type: :request do
  describe 'GET #index' do
    let(:movies) { create_list(:movie, 5) }
    let(:seasons) { create_list(:season, 5) }

    it 'return a successful response' do
      get '/api/v1/contents'

      expect(response).to be_successful
    end

    it 'request list of all movies and seasons' do
      get '/api/v1/contents'

      expect { seasons }.to change { Season.count }.by(5)
      expect { movies }.to change { Movie.count }.by(5)
    end
  end
end
