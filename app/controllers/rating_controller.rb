class RatingController < ApplicationController
  def create
    @rating = Rating.new(rating_params,service_id: params[:service_id])
    if @rating.save
    else
      render json: {message: "400 Bad Request"}, status: :bad_request
  end

  private 
  def rating_params
    params.require(:rating).permit(:grade,:comment)
  end
end
