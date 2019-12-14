class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
layout "admin"

  def index
    @admins_orders = Order.page(params[:page]).reverse_order
  end

  def show
    @admins_order = Order.find(params[:id])
    @user = @admins_order.user
    @order_products = @admins_order.order_products
    @order_product = OrderProduct.find(@admins_order.id)
  end


  def update
    @admins_order = Order.find(params[:id])
       if @admins_order.update(order_params)
      redirect_to admins_orders_path, notice: 'ユーザ情報を更新しました。'
   else
      render :show
    @user = @admins_order.user
    @order_products = @admins_order.order_products
    @order_product = OrderProduct.find(@admins_order.id)
   end

  end

private

  def order_params
    params.require(:order).permit(:user_id, :total_charge, :purchase_date, :payment_methods, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code)
  end

end
