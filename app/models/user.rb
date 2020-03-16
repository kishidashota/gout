class User < ApplicationRecord
  mount_uploader :user_image, ImageUploader
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
