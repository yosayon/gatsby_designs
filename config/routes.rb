Rails.application.routes.draw do
  #resources :reviews
  #resources :orders
  #resources :users
   root 'statics#home'
   get '/order_complete', :to => 'orders#thank_you'
   
   get '/login', :to => 'sessions#new'
   post '/login', :to => 'sessions#create'
   get '/signup', :to => 'users#new'
   post '/signup', :to => 'users#create'
   get '/auth/facebook/callback' => 'sessions#create'
   get 'logout' => 'sessions#destroy'
   
   resources :products
   
   resources :users, :only => [:show] do 
    resources :carts, :only => [:show, :update]
   end

   resources :users, :only => [:show] do
    resources :orders, :only => [:show, :index]
   end
   
   resources :products, :only => [:show] do
    resources :line_items, :only => [:create, :update, :destroy]
   end
 
end
