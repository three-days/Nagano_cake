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
  end

  def index
  	@orders = Order.where(user_id: current_user.id)
  end

  def show
  	@order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.build(order_params)
    @carts = current_user.carts
    @user = current_user
    @order = Order.new(order_params)
    @delivery = current_user.delivery

    order.total_charge = sum + postage
    order.purchase_date = now
    order.payment_method =
    order.destination_address = delivery.delivery_address
    order.destination_name = delivery.delivery_name
    order.distination_postal_code = delivery.delivery_postal_code

    current_user.carts.each do |t|
      order_product.number = t.product_number
    end
    order_product.tax_included = product.tax_excluded * 1.1

    if @order.save
      Cart.all.destroy
      redirect_to order_thanks_path
    else
      render :index

def total_charge
  @order = 
  @total_charge = 






  end

  def check
  end

  def thanks
  end

  def destroy

  end
private
  def order_params
    params.require(:order).permit(:user_id, :total_charge, :purchase_date, :payment_method, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code, :delivery_postal_code, :delivery_address, :delivery_name, deliveries_attributes: [:content])
  end

end
