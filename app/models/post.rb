class Post < ApplicationRecord
    belongs_to :customer
    belongs_to :topic


    validates :body, presence: true
end
