class Service < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  has_many :appointments
end
