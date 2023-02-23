# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  before_validation :defaults
  validates :content_id, presence: true
  validates :content_type, presence: true
  validates :video_quality, presence: true

  private

  def defaults
    expiration_date = DateTime.now + 2.days if expiration_date.blank?
  end
end
