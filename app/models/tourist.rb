class Tourist < ApplicationRecord
    attachment :image, destroy: false
    has_many :spots, dependent: :destroy
end
