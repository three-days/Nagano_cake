class OrdersController < ApplicationController

  def index
  	# @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
  end

  def show
  	@order = Order.find(params[:id])
  end

  def create

    @carts = current_user.carts
    @user = current_user
    @order = Order.new(order_params)
    @order.user_id = @user.id
    @order.purchase_date = DateTime.now
    if params[:back]
      @carts = current_user.carts
      @user = current_user
      @deliveries = current_user.deliveries
      @delivery = Delivery.new
      @order = Order.new
      @new_destination = Delivery.new
# 別のコントローラにrenderさせる際の記述。
# http://ihatov08.hatenablog.com/entry/2016/02/26/130212
      render 'carts/new'
    else @order.save
      sum = 0
      @carts.each do |cart|
        order_product = OrderProduct.new(product_id: cart.product_id,order_id: @order.id)
        order_product.tax_included = cart.product.tax_excluded * 1.1
        calc = order_product.tax_included * cart.product_number
        sum = sum + calc + 800
        order_product.number = cart.product_number
        order_product.save
      @order.update(total_charge: sum)
      @carts.delete_all
      redirect_to carts_thanks_path
      end
    end
  end


  private
  def order_params
    params.require(:order).permit(:user_id, :total_charge, :purchase_date, :payment_method, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code, :delivery_postal_code, :delivery_address, :delivery_name)
  end
  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :number, :tax_included, :production_status)
  end

end

