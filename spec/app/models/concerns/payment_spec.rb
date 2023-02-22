# frozen_string_literal: true

shared_examples 'payment' do
  it { is_expected.to have_many(:purchase_options) }
end
