class Admins::UsersController < ApplicationController

layout "admin"

  def index
    @admins_users = User.all
  end

  def show
    @admins_user = User.find(params[:id])
    @admins_order = Order.find(@admins_user.order_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def book_params
    params.require(:user).permit(:email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :user_address, :tele_number, :leave_status)
  end

end