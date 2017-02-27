class Product < ApplicationRecord
  searchkick
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :reviews
end
