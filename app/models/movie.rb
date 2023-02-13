class Movie < ApplicationRecord
    has_many :purchase_options
    validates :title, presence: true, uniqueness: true
    validates :plot, presence: true
end
