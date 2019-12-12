class Admins::TopController < ApplicationController

layout "admin"

  def index
    @orders = Order.all
  end
end
