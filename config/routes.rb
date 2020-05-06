Rails.application.routes.draw do
  get "/" => "home#index"
  resources :menu_items
  resources :orders
  resources :users
  resources :order_items
  resources :menus
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  put "/order_items/:id" => "menu_items#update"
end
