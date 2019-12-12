class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_up_path_for(resource)
  case resource
  when Admin
    admins_root_path
  when User
    users_root_path
  end
end

def after_sign_in_path_for(resource)
  case resource
  when Admin
    admins_root_path
  when User
    users_path
  end
end

def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      products_top_path
    end
end

protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postal_code, :user_address, :tele_number])
    end


end
