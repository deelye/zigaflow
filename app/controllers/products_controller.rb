class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    if @product.update(restaurant_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:product).permit(:gross)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
