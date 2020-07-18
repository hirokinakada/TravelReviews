class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :topics, dependent: :destroy
         has_many :posts, dependent: :destroy
         attachment :image, destroy: false
         has_many :reviews, dependent: :destroy
end
