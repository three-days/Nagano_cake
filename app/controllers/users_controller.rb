class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit]

	def index
		@user = current_user
		pp current_user
	end
	def show
		@user = current_user
	end
	def edit
		@user = current_user
	end
	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
		   redirect_to user_path(current_user.id)
		else
			render :edit
		end
	end

	def destroy
		@user = current_user
		@user.destroy
		redirect_to products_top_path
	end
	private
	def user_params
	  params.require(:user).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :user_address, :tele_number, :email, :deleted_at)

	end
end
