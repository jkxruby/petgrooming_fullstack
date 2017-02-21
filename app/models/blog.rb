class Blog < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :topic
	has_many :messages
end
