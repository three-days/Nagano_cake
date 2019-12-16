class Admins::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    redirect_to admins_orders_path
  end

private

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :number, :tax_included, :production_status)
  end

end
