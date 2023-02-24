# frozen_string_literal: true

class PurchaseOption < ApplicationRecord
  enum :video_quality, %i[HD SD]

  validates :price, presence: true
  validates :video_quality, presence: true
end
