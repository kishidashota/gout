class Post < ApplicationRecord
  mount_uploader :food_image, FoodImageUploader
  validates :shop_name, :description ,:address, presence: true
  belongs_to :user
end
