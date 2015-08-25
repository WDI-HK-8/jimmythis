class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
    @orders = @user.orders
    @info = {user: @user, services: @services, orders: @orders}
  end
end
