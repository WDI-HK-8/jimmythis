class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.nil?
      render json: {message: "Cannot find user"}, status: :not_found
    end
    @info = {user: @user,services: Service.where(user_id: params[:id]),orders: Order.where(user_id: params[:id])}
  end
end
