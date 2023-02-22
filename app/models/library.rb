# frozen_string_literal: true

class Library < ApplicationRecord
  belongs_to :user
  validates :content_id, presence: true
  validates :content_type, presence: true
  validates :video_quality, presence: true
end
