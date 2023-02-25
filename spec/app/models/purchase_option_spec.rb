# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:price) }
        it { should validate_presence_of(:video_quality) }
    end
    
    describe 'enums' do
        it { should define_enum_for(:video_quality).with_values(HD: 0, SD: 1) }
    end
end
