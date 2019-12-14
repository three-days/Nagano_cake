class ProductsController < ApplicationController
  def top
  	@products = Product.all
  	@genres = Genre.all.with_deleted
  end
  def create
    @product = Product.new(product_params)
    @product.save
  end
  def show
  end
end
