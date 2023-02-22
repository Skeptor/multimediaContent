# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.describe Movie, type: :model do
  it_behaves_like 'payment'

  it 'is not valid without valid attributes' do
    expect(Movie.new).not_to be_valid
  end

  it 'is valid with valid attributes' do
    expect(Movie.create(title: 'Test', plot: 'Test')).to be_valid
  end

  it 'is not valid without a title' do
    expect(Movie.create(title: nil, plot: 'Test')).not_to be_valid
  end

  it 'is not valid without a plot' do
    expect(Movie.create(title: 'Test', plot: nil)).not_to be_valid
  end
end
