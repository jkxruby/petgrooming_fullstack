class Blog < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :topic
	has_many :messages

	scope :recent, -> { order("created_at DESC")}
end
