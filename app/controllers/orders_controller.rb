class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @order = Order.new(order_params,service_id: params[:service_id],client_id: current_user.id)
    if @order.save
    else
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  private 
  def order_params
    params.require(:order).permit(:status)
  end
end
