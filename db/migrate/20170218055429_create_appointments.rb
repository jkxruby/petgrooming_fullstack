class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :booking_name
      t.integer :booking_phone
      t.integer :user_id
      t.integer :service_id
      t.datetime :booking_time

      t.timestamps
    end
  end
end
