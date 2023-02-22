# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.describe Season, type: :model do
  it_behaves_like 'payment'

  it 'is not valid without valid attributes' do
    expect(Season.new).not_to be_valid
  end

  it 'is valid with valid attributes' do
    expect(Season.create(title: 'Test', plot: 'Test', number: 1)).to be_valid
  end

  it 'is not valid without a title' do
    expect(Season.create(title: nil, plot: 'Test', number: 1)).not_to be_valid
  end

  it 'is not valid without a plot' do
    expect(Season.create(title: 'Test', plot: nil, number: 1)).not_to be_valid
  end

  it 'is not valid without a number' do
    expect(Season.create(title: 'Test', plot: 'Test', number: nil)).not_to be_valid
  end
end
