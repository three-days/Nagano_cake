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
    @order_product = @admins_order.order_product
  end

    def ajax
        @order_product = OrderProduct.find(params[:id])
        @variation = @product.variations.find_by(color: @selected_color)
    end

  def update
    @admins_order = User.find(params[:id])
       if @admins_order.update(user_params)
      redirect_to admins_orders_path, notice: 'You have updated user successfully.'
   else
      render :show
   end

  end

  def order_params
    params.require(:order).permit(:user_id, :total_charge, :purchase_date, :payment_methods, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code)
  end

end
