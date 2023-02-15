class Movie < ApplicationRecord
    has_many :purchase_options, :as => :payment
    
    validates :title, presence: true, uniqueness: true
    validates :plot, presence: true
end
