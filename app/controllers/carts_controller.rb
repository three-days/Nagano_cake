class CartsController < ApplicationController

  def new
    @carts = current_user.carts
    @user = current_user
    @deliveries = current_user.deliveries
    @delivery = Delivery.new
# 　　↓フォームタグの仮置したいための変数
    @order = Order.new

  end
  def index
    @carts = current_user.carts
  end
  def show
  	@carts = Cart.all
  	# @carts = current_user.carts
  end

  def create
    @cart = Cart.find_by(user_id: current_user.id, product_id: params[:cart][:product_id] )
    if @cart
      @cart.product_number += params[:cart][:product_number].to_i
    else
      @cart = Cart.new(cart_params)
      @cart.user_id= current_user.id
    end
    @cart.save
    redirect_to carts_path

    # オーダーセーブ仮
    # @order = Order.new(order_params)
    # respond_to do |format|
    #   if params[:back]
    #     format.html { render :new }
    #   elsif @order.save
    #     format.html { redirect_to :thanks }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.user_id= current_user.id
    @cart.update(cart_params)
    redirect_to carts_path
  end

  def confirm
    @carts = current_user.carts
    @user = current_user
    @order = Order.new(order_params)
    @deliveries = current_user.deliveries


  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end



  private
  def cart_params
    params.require(:cart).permit(:product_id, :product_number)
  end
  def order_params
    params.require(:order).permit(:user_id, :deliveries_id, :total_charge, :purchase_date, :payment_method, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code, :delivery_postal_code, :delivery_address, :delivery_name)
  end

end
