class Admins::OrdersController < ApplicationController

layout "admin"

  def index
    @admins_orders = Order.page(params[:page]).reverse_order
  end

  def show
    
  end

  def update
  end
end
