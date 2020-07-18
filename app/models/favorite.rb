class Favorite < ApplicationRecord
    belongs_to :customer
    belongs_to :review

    validates :customer_id, {presence: true}
	validates :review_id, {presence: true}
end
