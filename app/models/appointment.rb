class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :booking_name, presence: true
  validates :booking_phone, presence: true
  validates :booking_time, presence:true
  validates :booking_email, presence:true

end
