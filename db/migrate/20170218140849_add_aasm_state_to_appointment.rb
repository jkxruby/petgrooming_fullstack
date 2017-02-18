class AddAasmStateToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :aasm_state, :string, default: "order_placed"
    add_index  :appointments, :aasm_state
  end
end
