class OrdersController < ApplicationController
  def new
    @Order = Order.new
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
    @Order = Order.new(Order_params)
  end

  def check
  end

  def thanks
  end

end
