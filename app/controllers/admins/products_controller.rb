class Admins::ProductsController < ApplicationController

layout "admin"

  def index
    @admins_products = Product.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
