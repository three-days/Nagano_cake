class OrdersController < ApplicationController
  def new
    # カートnewに移動中
    @Order = Order.new
    @order.deliveries.build
    @carts = current_user.carts
    @user = current_user
    @deliveries = current_user.deliveries
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order_product = OrderProduct.find(@order.id)
  end

  def index
  	# @orders = Order.where(user_id: current_user.id)
    @orders = Order.all
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

      render :new
    else @order.save
      sum = 0
      @carts.each do |cart|
        order_product = OrderProduct.new(product_id: cart.product_id,order_id: @order.id)
        order_product.tax_included = cart.product.tax_excluded * 1.1
        calc = order_product.tax_included * cart.product_number
        sum = sum + calc + 800
        order_product.number = cart.product_number
        order_product.save
      end
    end
      @order.update(total_charge: sum)
      @carts.delete_all
      redirect_to carts_thanks_path
  end

# def total_charge
#   sum = 0
#   @carts.each do |cart|
#    calc = cart.product.tax_excluded * cart.product_number
#    sum = sum + calc + 800
#    @order.tota;_charge = sum
#   end
# end


# def total_charge
#   @order = 
#   @total_charge = 
# end


  def check
  end

  def thanks
  end

  def destroy

  end
  private
  def order_params
    params.require(:order).permit(:user_id, :total_charge, :purchase_date, :payment_method, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code, :delivery_postal_code, :delivery_address, :delivery_name)
  end
  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :number, :tax_included, :production_status)
  end

end

