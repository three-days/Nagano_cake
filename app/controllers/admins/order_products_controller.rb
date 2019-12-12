class Admins::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update
    
  end
  
end
