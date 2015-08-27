class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Service.find(params[:service_id]).ratings.new(rating_params)
    unless @rating.save
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  private 
  def rating_params
    params.require(:rating).permit(:grade,:comment,:user_id)
  end
end
