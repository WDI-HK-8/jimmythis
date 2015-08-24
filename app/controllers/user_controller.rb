class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = Services.where(user_id: params[:id])
    @orders = Orders.where(user_id: params[:id])
  end
end
