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
    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end
end
