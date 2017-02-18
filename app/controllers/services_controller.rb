class ServicesController < ApplicationController
    def index
        @services = Service.all
     end

    def show
        @service = Service.find(params[:id])
        @appointment = Appointment.new
    end
end
