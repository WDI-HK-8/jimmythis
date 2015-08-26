class ServicesController < ApplicationController
  def index
    @services = Service.all.includes(:ratings)
    @avgs = []
    @services.each do |service|
      service.average_rating
    end
  end

  def create
    if user_signed_in?
      @service = current_user.services.new(service_params)
      unless @service.save
        render json: {message: "400 Bad Request"}, status: :bad_request
      end
    else
      render json: {message: "User not authenticated"}, status: :unauthenticated
    end
  end

  def show
    @service = Service.find(params[:id])
    if @service.nil?
      render json: {message: "Cannot find service"}, status: :not_found
    end
    @service.average_rating
  end

  def update
    if user_signed_in?
      @service = Service.find(params[:id])
      if @service.nil?
        render json: {message: "Cannot find service"}, status: :not_found
      end
      @service.update(service_params)
      render json: {message: "User updated"}
    else
      render json: {message: "User not authenticated"}, status: :unauthenticated
    end
  end

  def destroy
    if user_signed_in?
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
    else
      render json: {message: "User not authenticated"}, status: :unauthenticated
    end
  end

  private
  def service_params
    params.require(:service).permit(:title,:description,:district,:category_id)
  end
end
