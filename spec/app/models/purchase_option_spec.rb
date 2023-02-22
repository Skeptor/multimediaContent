# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  it { is_expected.to have_db_column(:payment_id).of_type(:integer) }
  it { is_expected.to have_db_column(:payment_type).of_type(:string) }

  it { is_expected.to belong_to(:payment) }
end
