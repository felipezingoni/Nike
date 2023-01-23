Rails.application.routes.draw do
  devise_for :users
  resources :sneakers

  root 'pages#home'
  resources :order_items, only: [:create]
  resources :orders, only: [:show] do
    get '/current', to: 'orders#current', on: :collection
  end
  resources :checkout, only: [:create]
end
