class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    service = Service.find(params[:service_id])
    @rating = service.ratings.create(rating_params, client_id: current_user.id)
    unless @rating.save
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
    average_grade = Rating.where(service_id: params[:service_id]).average(:grade)
    Service.update(params[:service_id],average_grade: average_grade)

  end

  private 
  def rating_params
    params.require(:rating).permit(:grade,:comment)
  end
end
