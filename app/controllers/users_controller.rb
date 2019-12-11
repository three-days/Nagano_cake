class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show]

	def index
	end
	def show
		@user = current_user
		pp current_user
		
	end
	def edit
		@user = current_user
	end

	def destroy
		@users = current_user
	end
	
end
