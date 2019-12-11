class CartsController < ApplicationController
  def index
    @carts = current_user.carts
  end
  def show
  	@carts = Cart.all
  	# @carts = current_user.carts
  end
  def create
    @cart = Cart.new(cart_params)
    @cart.user_id= current_user.id
    @cart.save
    redirect_to carts_path

  end

    # カート追加用の記述
  # def add_to_cart
  #     product = Product.find(params[:id])
  #     @cart.add_product(product)
  #     redirect_to(:action => 'display_cart')
  # end

   #商品詳細画面の「この商品をカートに入れる」ボタンクリック時のアクション
  # def add
  #   session[:cart] ||= Cart.new
  #   session[:cart].add(Catalog.find(params[:id]))
  #   @cart = session[:cart]
  #   render :action => 'cart.html.erb'
  # end

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
