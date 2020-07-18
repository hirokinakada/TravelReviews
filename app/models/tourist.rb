class Tourist < ApplicationRecord
    default_scope -> { order(created_at: :desc) }#投稿順に
    
    attachment :image, destroy: false
    has_many :spots, dependent: :destroy

    def Tourist.search(search, tourist_or_spot, how_search)
        if how_search == "1"
            Tourist.where(['name LIKE ?', "%#{search}%"])
        elsif how_search == "2"
            Tourist.where(['name LIKE ?', "%#{search}"])
        elsif how_search == "3"
            Tourist.where(['name LIKE ?', "#{search}%"])
        elsif how_search == "4"
            Tourist.where(['title LIKE ?', "#{search}"])
        else
            Tourist.all
        end
    end
end
