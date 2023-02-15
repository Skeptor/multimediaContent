class PurchaseOption < ApplicationRecord
    belongs_to :payment, polymorphic: true
    enum :video_quality, [:HD, :SD]

    validates :price, presence: true
    validates :video_quality, presence: true
end
