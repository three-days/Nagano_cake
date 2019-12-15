class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
 layout "admin"

  def index
    @admins_users = User.all.with_deleted
  end

  def show
    @admins_user = User.with_deleted.find(params[:id])
    @orders = @admins_user.orders.page(params[:page]).reverse_order
  end

  def edit
    @admins_user = User.with_deleted.find(params[:id])
  end

  def update
    @admins_user = User.with_deleted.find(params[:id])
       if @admins_user.update(user_params)
      redirect_to admins_user_path(@admins_user.id), notice: '更新しました。'
   else
      render :edit
   end
  end
  def user_restore
    @admins_user = User.only_deleted.find(params[:id]).restore
    redirect_to admins_users_path
  end

  def destroy
    @admins_user = User.with_deleted.find(params[:id])
    @admins_user.destroy
    redirect_to admins_users_path
  end
private
  def user_params
    params.require(:user).permit(:email, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :user_address, :tele_number, :deleted_at)
  end

end