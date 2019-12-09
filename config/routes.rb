Rails.application.routes.draw do




namespace :admins do
    root "top#index"
    resources :products
    resources :users, only:[:index, :show, :edit, :update, :destroy]
    resources :orders, only:[:index, :show, :update]
    resources :order_products, only:[:update]
    resources :genres, only:[:index, :create, :update, :destroy]

end
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}



devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}


end


