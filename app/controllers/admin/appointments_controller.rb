class Admin::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  
  def index
    @appointments = Appointment.all
  end
end
