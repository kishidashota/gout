class User < ApplicationRecord
  mount_uploader :user_image, ImageUploader
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts, dependent: :destroy
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    validates :user_name, presence: true
    validates :user_image, presence: true
    validates :love_brand, presence: true 
    enum love_brand:{
      アサヒ: 0, 
      キリン: 1, 
      サッポロ: 2, 
      サントリー: 3, 
      エビス: 4, 
      オリオン: 5,
      クラフト: 6,
      その他: 7
    }
    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end
end
