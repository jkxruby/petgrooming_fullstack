class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    @service = Service.find(params[:service_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.service = @service
    @appointment.user = current_user
    @appointment.make_appointment!

    if @appointment.save

      redirect_to service_path(@service), notice: "You have Booked Successfully"
    else
      redirect_to service_path(@service), alert: "You have to complete the whole form"


    end

  end

  private
  def appointment_params
    params.require(:appointment).permit(:booking_name, :booking_email, :booking_phone, :booking_time)
  end
end
