Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :carts
  resources :line_items
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
