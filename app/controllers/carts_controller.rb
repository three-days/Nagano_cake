class CartsController < ApplicationController

  def new
    @carts = current_user.carts
    @user = current_user
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
end
