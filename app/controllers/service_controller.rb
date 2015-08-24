class ServiceController < ApplicationController
  def index
    @services = Service.all
  end

  def create
    @service = Service.new(service_params)
    if @service.save
    else
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  def show
    @service = Service.find(params[:id])
    if @service.nil?
      render json: {message: "Cannot find service"}, status: :not_found
    end
    @info = {service: @service, seller: User.where(id: @service.user_id), ratings: Rating.where(service_id: params[:id])}
  end

  def update
    @service = Service.find(params[:id])
    if @service.nil?
      render json: {message: "Cannot find service"}, status: :not_found
    end
    @service.update(service_params)
  end

  def destroy
    @service = Service.find(params[:id])

    if @service.nil?
      render json: {message: "Cannot find service"}, status: :not_found
    else
      if @service.destroy
        render json: {message: "Successfully deleted"}, status: :no_content
      else
        render json: {message: "Unsuccessfully deleted"}, status: :bad_request
      end
    end
  end

  private
  def service_params
    params.require(:service).permit(:title,:description,:district,:category_id)
  end
end
