class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def show_orders
    @orders = User.find(params[:id]).orders
    render 'show'
  end

  def show_services
    @services = User.find(params[:id]).services
    render 'show'
  end
end
