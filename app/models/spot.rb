class Spot < ApplicationRecord
    belongs_to :tourist
    attachment :image, destroy: false

    geocoded_by :address
    after_validation :geocode, if: :address_changed?
end
