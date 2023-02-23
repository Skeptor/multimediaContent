# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:movie) { create(:movie) }
  let(:user) { create(:user) }

  let(:movie_params) do
    { user_id: user.id,
      content_id: movie.id,
      content_type: 'Movie',
      video_quality: 1 }
  end

  it 'is not valid without valid attributes' do
    expect(Purchase.new).not_to be_valid
  end

  it 'add a purchase with valid attribues' do
    expect { Purchase.create(movie_params) }.to change { Purchase.count }.by(1)
  end
end
