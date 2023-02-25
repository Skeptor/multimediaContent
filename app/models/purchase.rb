# frozen_string_literal: true

class Purchase < ApplicationRecord
  EXPIRATION_TIME = 2.days
  belongs_to :user
  belongs_to :purchase_option
  
  attribute :expiration_date, default: -> { DateTime.now + EXPIRATION_TIME }
  validates :content_id, presence: true
  validates :content_type, presence: true
end
