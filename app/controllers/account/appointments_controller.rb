class Account::AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end
end