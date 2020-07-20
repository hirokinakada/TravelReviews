class Post < ApplicationRecord
    belongs_to :customer
    belongs_to :topic


    validates :name, presence: true
    validates :body, presence: true
end
