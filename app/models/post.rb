class Post < ApplicationRecord
  mount_uploader :food_image, FoodImageUploader
  validates :shop_name, :description ,:address, presence: true
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search
      Post.where('assortment LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
