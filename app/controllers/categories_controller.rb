class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
    else
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  def show
    @services = Service.where(category: params[:id])
    if @services.nil?
      render json: {message: "Cannot find category or category has no services"}, status: :not_found
    end
  end

  private 
  def category_params
    params.require(:category).permit(:name)
  end
end
