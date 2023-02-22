# frozen_string_literal: true

module Payment
  extend ActiveSupport::Concern

  included do
    has_many :purchase_options, as: :payment
  end
end
