class Topic < ApplicationRecord
    default_scope -> { order(created_at: :desc) }#投稿順に
    
    belongs_to :customer
    has_many :posts, dependent: :destroy
end
