class Review < ApplicationRecord
    belongs_to :customer
    belongs_to :spot
    attachment :image, destroy: false
end
