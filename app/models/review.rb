class Review < ApplicationRecord
    attachment :image, destroy: false
    belongs_to :customer
    belongs_to :spot
    has_many :favorites, dependent: :destroy
	def favorited_by?(customer)
	favorites.where(customer_id: customer.id).exists?
    end
    
end
