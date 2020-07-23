class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
        has_many :topics, dependent: :destroy
        has_many :posts, dependent: :destroy
        attachment :image, destroy: false
        has_many :reviews, dependent: :destroy
        has_many :favorites, dependent: :destroy

#バリデーション
        validates :first_name,presence:true
        validates :last_name,presence:true
        validates :first_name_kana,presence:true
        validates :last_name_kana,presence:true
        validates :nickname,presence:true

#フォロー・フォロワーについて
        has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
        has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
        has_many :following_customer, through: :follower, source: :followed # 自分がフォローしている人
        has_many :follower_customer, through: :followed, source: :follower # 自分をフォローしている人


        def unfollow(customer_id)
          follower.find_by(followed_id: customer_id).destroy
        end

        def follow(customer_id)
          follower.create(followed_id: customer_id)
        end

        def following?(customer)
          following_customer.include?(customer)
        end
end
