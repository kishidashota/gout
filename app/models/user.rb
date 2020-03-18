class User < ApplicationRecord
  mount_uploader :user_image, ImageUploader
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts
    has_many :comments
end
