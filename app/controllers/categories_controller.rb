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
    @services = Service.where(category: params[:id])
    if @services.nil?
      render json: {message: "Cannot find category or category has no services"}, status: :not_found
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
