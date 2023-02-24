# frozen_string_literal: true

class Movie < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :plot, presence: true
end
