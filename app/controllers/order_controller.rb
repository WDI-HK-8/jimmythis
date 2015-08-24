class OrderController < ApplicationController
  def create
    @order = Order.new(order_params,service_id: params[:service_id],user_id: 'user_id')
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
