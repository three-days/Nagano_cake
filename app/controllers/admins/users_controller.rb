class Admins::UsersController < ApplicationController

# before_action :authenticate_user!

 layout "admin"

  def index
    @admins_users = User.all
  end

  def show
    @admins_user = User.find(params[:id])
    @orders = @admins_user.orders.page(params[:page]).reverse_order
  end

  def edit
    @admins_user = User.find(params[:id])
  end

  def update
    @admins_user = User.find(params[:id])
       if @admins_user.update(user_params)
      redirect_to admins_user_path(@admins_user.id), notice: 'You have updated user successfully.'
   else
      render :edit
   end
  end

#destroyコントローラは不要と思われますが。。。残しておきます。
  def destroy
  end

  def user_params
    params.require(:user).permit(:email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :user_address, :tele_number, :leave_status)
  end

end