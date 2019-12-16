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
    @order.save
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
