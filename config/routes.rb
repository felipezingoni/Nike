Rails.application.routes.draw do
  resources :sneakers
  resources :controllers
  root 'pages#home'

end
