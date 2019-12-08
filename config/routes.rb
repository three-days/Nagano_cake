Rails.application.routes.draw do
  # devise_for :users
  devise_for :admin_users, controllers: {
    sessions: 'admin/admin_users/sessions',
    passwords: 'admin/admin_users/passwords',
    registrations: 'admin/admin_users/registrations'
  }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
