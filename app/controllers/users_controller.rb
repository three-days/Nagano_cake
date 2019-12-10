class UsersController < ApplicationController

	def index
	end
	def show
		@users = current_user
		
	end
	def edit
		@user = User.find(params[:id])
	end

	def destroy

	end
	
end
