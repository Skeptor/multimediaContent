# frozen_string_literal: true

class Season < ApplicationRecord
  include Payment
  has_many :episodes, -> { order(:number) }, inverse_of: :season, dependent: :destroy

  validates :title, presence: true
  validates :plot, presence: true
  validates :number, presence: true
  validates_uniqueness_of :number, scope: :title
end
