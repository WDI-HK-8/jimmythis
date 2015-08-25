class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.new(rating_params,service_id: params[:service_id],user_id: current_user.id)
    if @rating.save
    else
      render json: {message: "400 Bad Request"}, status: :bad_request
  end

  private 
  def rating_params
    params.require(:rating).permit(:grade,:comment)
  end
end
