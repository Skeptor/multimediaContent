class PurchaseOption < ApplicationRecord
    enum :video_quality, [HD: 0, SD: 1]

    validates :price, presence: true
    validates :video_quality, presence: true
end
