class Spot < ApplicationRecord
    default_scope -> { order(created_at: :desc) }#投稿順に
    has_many :reviews, dependent: :destroy
    belongs_to :tourist
    attachment :image, destroy: false

    geocoded_by :address
    after_validation :geocode, if: lambda {|obj| obj.address_changed?}


    validates :name, presence: true
    validates :overview, presence: true
    validates :address, presence: true
    validates :tourist_id, presence: true
    


    def Spot.search(search)
        return Spot.all unless search
        Spot.where(['name LIKE ? OR address LIKE ? OR overview LIKE ?', "%#{search}%","%#{search}%","%#{search}%"])
      end
end
