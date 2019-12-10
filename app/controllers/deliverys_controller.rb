class DeliverysController < ApplicationController
	def show
		@deliverys = current_user
		@deliverys = Delivery.new
	end

	def new
		@deliverys = Delivery.new
	end

	def create
		@deliverys = current_user
	end

	def edit
		@deliverys = current_user
	end

	def update
		@deliverys = current_user
	end

	def update
		@deliverys = current_user
	end
end
