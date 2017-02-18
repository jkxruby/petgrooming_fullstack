class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :booking_name, presence: true
  validates :booking_phone, presence: true
  validates :booking_time, presence:true
  validates :booking_email, presence:true

  def book!
    self.update_columns(is_booked: true)
  end


  include AASM
  aasm do
    state :order_placed, initial: true
    state :booked
    state :confirming
    state :confirmed
    state :appointment_cancelled

    event :make_appointment, after_commit: :book! do
      transitions from: :order_placed, to: :booked
    end

    event :deal do
      transitions from: :booked,  to: :confirming
    end

    event :confirm do
      transitions from: :confirming, to: :confirmed
    end

    event :cancel_appointment do
      transitions from: [:booked, :confirming, :confirmed], to: :appointment_cancelled
    end
  end
end
