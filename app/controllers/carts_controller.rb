class CartsController < ApplicationController
  def new
  	@carts = Cart.all
  	@carts = current_user.carts
  end
  def show
  	@carts = Cart.all
  	@carts = current_user.carts
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to "carts/new"
  end
end
