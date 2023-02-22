# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is not valid without valid attributes' do
    expect(Purchase.new).not_to be_valid
  end
end
