class AddIsBookedToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :is_booked, :boolean, default: false
  end
end
