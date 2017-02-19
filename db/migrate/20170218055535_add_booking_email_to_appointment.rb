class AddBookingEmailToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :booking_email, :string
  end
end
