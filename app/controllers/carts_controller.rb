class CartsController < ApplicationController
  before_action :authenticate_user!
  def new
    @carts = current_user.carts
    @user = current_user
    @deliveries = current_user.deliveries
    @delivery = Delivery.new
# 　　↓フォームタグの仮置したいための変数
    @order = Order.new

    @new_destination = Delivery.new

# nil? では出来ない模様。blank? だと、 nil? と empty? の合わせ技となる。
# https://qiita.com/somewhatgood@github/items/b74107480ee3821784e6
      if @carts.blank?
        redirect_to products_top_path
      end
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

      if params[:address_set] == "user_address"
        @order.destination_postal_code = current_user.postal_code
        @order.destination_address = current_user.user_address
        @order.destination_name = current_user.family_name_kanji + current_user.first_name_kanji
      elsif params[:address_set] == "delivery_address"
        @delivery =  Delivery.find(params[:order][:user_id])
        @order.destination_postal_code = @delivery.delivery_postal_code
        @order.destination_address = @delivery.delivery_address
        @order.destination_name = @delivery.delivery_name
      else params[:address_set] == "new_delivery_address"
        @new_destination = Delivery.new(delivery_params)
        @new_destination.user_id = current_user.id
        @new_destination.save
        @order.destination_postal_code = @new_destination.delivery_postal_code
        @order.destination_address = @new_destination.delivery_address
        @order.destination_name = @new_destination.delivery_name
      end

      if @carts.blank?
        redirect_to products_top_path
      end

#Delivery.saveできない状態のままになっています。
#一度deliveryに飛びsaveさせてから戻ってくるやり方。ダサいけど確実。
#deliveryに飛んでsaveさせるにしても、renderで内部のデータを保持したまま遷移させるやり方が一つ。
#画面内でdelivery_paramsを駆使しながらああだこうだやってやる方法もある。私は諦めました。




    end

    # @deliveries = current_user.deliveries

  def confirm_check
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
  def delivery_params
    params.require(:delivery).permit(:delivery_address, :delivery_name, :delivery_postal_code)
  end
end
