class Admin::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @appointments = Appointment.all
  end

    def deal
      @appointment = Appointment.find(params[:id])
      @appointment.deal!
      redirect_to :back
    end

    def confirm
      @appointment = Appointment.find(params[:id])
      @appointment.confirm!
      redirect_to :back
    end

    def cancel
      @appointment = Appointment.find(params[:id])
      @appointment.cancel_appointment!
      redirect_to :back
    end
end
