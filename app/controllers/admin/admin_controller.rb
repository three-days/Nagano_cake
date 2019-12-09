class Admin::AdminController < ApplicationController
  layout "admin/layouts/application"

  before_action :authenticate_admin_user!

  def top
  end

end