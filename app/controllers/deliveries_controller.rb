class DeliveriesController < ApplicationController
  def show
    @delivery = Delivery.select(current_user)
    @deliveries = current_user.deliveries
    @delivery = Delivery.new
  end

  def new
  end

  def create
    @deliveries = Delivery.all

    @delivery = Delivery.new(delivery_params)
    @delivery.user_id = current_user.id
        if @delivery.save
              @delivery = Delivery.select(current_user)

    @delivery = Delivery.new
          redirect_to delivery_path(current_user)
        else
          render :show
        end

  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    @delivery = Delivery.select(current_user)
    @deliveries = Delivery.all
    @delivery = Delivery.new
    redirect_to delivery_path(current_user)
  end

  def destroy
    p = Delivery.find(params[:id])
    p.destroy
    @delivery = Delivery.select(current_user)
    @deliveries = Delivery.all
    @delivery = Delivery.new
    redirect_to delivery_path(current_user)
  end


private
    def delivery_params
    params.require(:delivery).permit(:delivery_address, :delivery_name, :delivery_postal_code)

  end


end
