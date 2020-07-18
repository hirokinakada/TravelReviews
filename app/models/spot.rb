class Spot < ApplicationRecord
    default_scope -> { order(created_at: :desc) }#投稿順に
    has_many :reviews, dependent: :destroy
    belongs_to :tourist
    attachment :image, destroy: false

    geocoded_by :address
    after_validation :geocode, if: :address_changed?



def Spot.search(search, tourist_or_spot, how_search)
    if how_search == "1"
        Spot.where(['name LIKE ?', "%#{search}%"])
    elsif how_search == "2"
        Spot.where(['name LIKE ?', "%#{search}"])
    elsif how_search == "3"
        Spot.where(['name LIKE ?', "#{search}%"])
    elsif how_search == "4"
        Spot.where(['name LIKE ?', "#{search}"])
    else
        Spot.all
    end
end
end
