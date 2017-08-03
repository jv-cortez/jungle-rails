class CategoriesController < ApplicationController
  
  def index
    @category_products = @category.all.order(category_id: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
