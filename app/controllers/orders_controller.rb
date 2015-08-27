class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @order = Service.find(params[:service_id]).orders.new(order_params)
    unless @order.save
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  private 
  def order_params
    params.require(:order).permit(:status,:user_id)
  end
end
