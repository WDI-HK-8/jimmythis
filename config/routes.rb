Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  root 'static_pages#index'
  
  get '/users/:id', to: 'users#show'
  get '/users/:id/orders', to: 'users#show_orders'
  get '/users/:id/services', to: 'users#show_services'

  resources :services do
    resources :orders
    resources :ratings
  end
  resources :categories


end
