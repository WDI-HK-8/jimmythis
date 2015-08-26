class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Service.find(params[:service_id]).ratings.create(rating_params, user: current_user.id)
    unless @rating.save
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  private 
  def rating_params
    params.require(:rating).permit(:grade,:comment)
  end
end
