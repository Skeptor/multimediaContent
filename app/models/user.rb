class User < ApplicationRecord
    has_one :libraries
    validates :email, presence: true, uniqueness: true
end
