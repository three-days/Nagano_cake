Rails.application.routes.draw do

  root'products#top'

  get 'carts/thanks'
# getとpostが同時に使用されているのはどうしてですか？
  get 'carts/confirm' => 'carts#confirm',as: 'carts_confirm'
  get 'products/top'
  # カートに入れる用ルーティング
  post '/add_product' => 'carts#add_product'
  post '/update_item' => 'carts#update_product'
  delete '/delete_product' => 'carts#delete_product'



resources :products
resources :carts
resources :carts, only: [:index]
resources :orders



namespace :admins do
    root "top#index"
    resources :products
    resources :users, only:[:index, :show, :edit, :update, :destroy] do
      member do
        patch 'user_restore'
      end
    end
    resources :orders, only:[:index, :show, :update]
    resources :order_products, only:[:update]
    resources :genres, only:[:index, :create, :edit, :update, :destroy] do
      member do
        patch 'genre_restore'
      end
    end
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




resources :users, only:[:index, :create, :edit, :show, :update, :destroy]
resources :deliveries, only:[:index, :new, :create, :edit, :show, :update, :destroy]
  # For details on the DSL availa
end








