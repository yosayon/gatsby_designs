Rails.application.routes.draw do
  #resources :reviews
  #resources :orders
  #resources :carts
  #resources :line_items
  #resources :products
  #resources :users
   root 'statics#home'
   
   get '/login', :to => 'sessions#new'
   post '/login', :to => 'sessions#create'
   get '/signup', :to => 'users#new'
   post '/signup', :to => 'users#create'
   get '/auth/facebook/callback' => 'sessions#create'
   get 'logout' => 'sessions#destroy'
end
