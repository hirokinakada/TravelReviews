class Tourist < ApplicationRecord
    default_scope -> { order(created_at: :desc) }#投稿順に
    
    attachment :image, destroy: false
    has_many :spots, dependent: :destroy

    validates :name, presence: true
    validates :overview, presence: true
    


end
