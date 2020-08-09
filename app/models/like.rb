class Like < ApplicationRecord
    belongs_to :customer
    belongs_to :spot

    validates :customer_id, {presence: true}
	validates :spot_id, {presence: true}
end
