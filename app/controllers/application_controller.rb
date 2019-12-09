class ApplicationController < ActionController::Base


def after_sign_up_path_for(resource)
  case resource
  when Admin
    admins_home_path
  when User
    users_home_path
  end
end

def after_sign_in_path_for(resource)
  case resource
  when Admin
    admins_home_path
  when User
    users_home_path
  end
end




end
