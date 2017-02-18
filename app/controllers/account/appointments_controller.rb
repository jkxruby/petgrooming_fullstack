class Account::AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end

  def apply_to_cancel
    @appointment = Appointment.find(params[:id])
    @appointment.cancel_appointment!
   redirect_to :back
  end

end
