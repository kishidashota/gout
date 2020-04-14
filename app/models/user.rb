class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_name, presence: true, length: { maximum: 6 }
  validates :user_image, :love_brand, presence: true
 
  mount_uploader :user_image, ImageUploader
    has_many :posts, dependent: :destroy
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post

    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end
end
