# frozen_string_literal: true

class Episode < ApplicationRecord
  belongs_to :season
  validates :title, presence: true
  validates :plot, presence: true
  validates :number, presence: true
  validates_uniqueness_of :number, scope: :season_id
end
