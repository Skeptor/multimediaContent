class Library < ApplicationRecord
    belongs_to :user
    validates :content_id, uniqueness: { scope: :content_type }
end
