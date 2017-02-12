class Admin::ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
      @service = Service.new(service_params)

      if @service.save
          redirect_to admin_services_path
      else
          render :new
      end
  end

  def edit
      @service = Service.find(params[:id])
  end

  def update
      @service = Service.find(params[:id])

      if @service.update(service_params)
          redirect_to admin_services_path
      else
          render :edit
      end
  end


  private
  def service_params
    params.require(:service).permit(:title, :price, :description)
  end
end
