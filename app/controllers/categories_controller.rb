class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    unless @category.save
      render json: {message: "400 Bad Request"}, status: :bad_request
    end
  end

  def show
    @services = Category.find(params[:id]).services.includes(:ratings)
    if @services.nil?
      render json: {message: "Cannot find category or category has no services"}, status: :not_found
    end
    @services.each do |service|
      service.average_rating
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.nil?
      render json: {message: "Cannot find category"}, status: :not_found
    end
    @category.update(category_params)
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.nil?
      render json: {message: "Cannot find category"}, status: :not_found
    else
      if @category.destroy
        render json: {message: "Successfully deleted"}, status: :no_content
      else
        render json: {message: "Unsuccessfully deleted"}, status: :bad_request
      end
    end
  end

  private 
  def category_params
    params.require(:category).permit(:name)
  end
end
