class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @order = Service.find(params[:service_id]).orders.new(order_params)
    unless @order.save
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  def update
    if user_signed_in?
      @order = Order.find(params[:id])
      if @order.nil?
        render json: {message: "Cannot find order"}, status: :not_found
      end
      @order.update(order_params)
      render json: {message: "User updated"}
    else
      render json: {message: "User not authenticated"}, status: :unauthenticated
    end
  end

  private 
  def order_params
    params.require(:order).permit(:status,:user_id)
  end
end
