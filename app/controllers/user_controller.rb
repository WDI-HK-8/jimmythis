class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @services = Service.where(user_id: params[:id])
    # @orders = Order.where(user_id: params[:id])
  end
end
