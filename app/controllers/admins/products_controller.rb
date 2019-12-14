class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

#使用するヘッダー（レイアウト）を指定する旨です。
layout "admin"

  def index
    @admins_products = Product.page(params[:page]).reverse_order

  end

  def show
    @admins_product = Product.find(params[:id])
    @genre = Genre.find(@admins_product.genre_id)
  end

  def new
    @admins_product = Product.new

  end

  def edit
    @admins_product = Product.find(params[:id])
  end

  def create
    @admins_product = Product.new(product_params)
   if @admins_product.save
    redirect_to admins_product_path(@admins_product.id), notice: 'You have created product successfully.'
   else
    @admins_products = Product.page(params[:page]).reverse_order
    render :index
   end
  end
  def update
    @admins_product = Product.find(params[:id])
       if @admins_product.update(product_params)
      redirect_to admins_product_path(@admins_product.id), notice: 'You have updated user successfully.'
   else
      render :edit
   end
  end

#destroy不要かも。保留。
  def destroy
  end

 private

  def product_params
    params.require(:product).permit(:genre_id, :image, :product_name, :product_description, :tax_excluded, :sale_status)
  end

end

