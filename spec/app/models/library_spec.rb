# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Library, type: :model do
  it 'is not valid without valid attributes' do
    expect(Library.new).not_to be_valid
  end
end
