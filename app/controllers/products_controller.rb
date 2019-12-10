class ProductsController < ApplicationController
  def top
  	@products = Product.all
  end
  def create
    @product = Product.new(product_params)
    @product.save
  end
  def show
  end
end
