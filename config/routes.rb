Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  root 'static_pages#index'
  
  get '/users/:id?includes=orders,services', to: 'users#show'

  resources :services
  resources :categories

  post '/services/:service_id/ratings', to: 'ratings#create'
  post 'services/:service_id/orders', to: 'orders#create'


end
