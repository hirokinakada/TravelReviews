class Review < ApplicationRecord
    default_scope -> { order(created_at: :desc) }#投稿順に

    attachment :image, destroy: false
    belongs_to :customer
    belongs_to :spot
    has_many :favorites, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true
    

	def favorited_by?(customer)
	favorites.where(customer_id: customer.id).exists?
    end
    
end
