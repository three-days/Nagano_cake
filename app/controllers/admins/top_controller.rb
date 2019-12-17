class Admins::TopController < ApplicationController
  before_action :authenticate_admin!
layout "admin"

  def index
    today = Date.today
    @orders = Order.where("purchase_date >= ?", Time.zone.now.beginning_of_day)
    @orders.count
  end

end
