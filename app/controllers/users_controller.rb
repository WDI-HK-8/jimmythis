class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def show_orders
    @orders = Order.where(user_id: User.find(params[:id])[:id])
    render 'show'
  end

  def show_services
    @services = User.find(params[:id]).services.includes(:orders)
    @services.each do |service|
      service.average_rating
    end
    render 'show'
  end
end
