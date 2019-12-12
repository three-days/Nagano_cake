class Admins::TopController < ApplicationController
  before_action :authenticate_admin!
layout "admin"

  def index
    @orders = Order.all
  end
end
