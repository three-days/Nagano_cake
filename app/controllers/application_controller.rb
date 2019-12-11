class ApplicationController < ActionController::Base



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

def after_sign_out_path_for(resource)
    products_top_path # ログアウト後に遷移するpathを設定
end



end
