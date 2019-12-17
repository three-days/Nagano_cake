class DeliverysController < ApplicationController
	def show
		@delivery = Delivery.select(current_user)
		@deliverys = Delivery.all
		@delivery = Delivery.new
	end

	def new
	end

	def create
		p delivery_params
		@delivery = Delivery.new(delivery_params)
        if @delivery.save
        			@delivery = Delivery.select(current_user)
		@deliverys = Delivery.all
		@delivery = Delivery.new
        	redirect_to delivery_path(current_user)
        else
        	render :show
        end

	end

	def edit
		@deliverys = current_user
	end

	def update
		@deliverys = current_user
		@delivery.update(delivery_params)
	end

	def update
		@deliverys = current_user
	end


private
	  def delivery_params
	  params.require(:delivery).permit(:delivery_address, :delivery_name, :delivery_postal_code)

	end


end
