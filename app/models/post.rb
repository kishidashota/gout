class Post < ApplicationRecord
  mount_uploader :food_image, FoodImageUploader
  validates :shop_name, :description ,:address,:food_image, presence: true
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  geocoded_by :address
  after_validation :geocode

  def self.search(search)
    if search
      Post.where('shop_name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
