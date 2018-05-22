Rails.application.routes.draw do

 #statics controller
   root 'statics#home'
   get '/about', :to => 'statics#about'
   get '/contact', :to => 'statics#contact'
 
 #orders#thank_you
   get '/order_complete', :to => 'orders#thank_you'
   
 #sessions controller
   get '/login', :to => 'sessions#new'
   post '/login', :to => 'sessions#create'
   get '/auth/facebook/callback' => 'sessions#create'
   get 'logout' => 'sessions#destroy'
 
 #users controller  
   get '/signup', :to => 'users#new'
   post '/signup', :to => 'users#create'
 
 #nested user and cart routes. A user should be able to view/update his/her cart only.  
   resources :users, :only => [:show] do 
    resources :carts, :only => [:show, :update]
   end
 
 #nested user and orders route. A user can only view his/her order and orders. 
   resources :users, :only => [:show] do
    resources :orders, :only => [:show, :index]
   end
 
  resources :products, :only => [:index]
 
 #nested product and line_items route. A user can create/update/destoy the line_items for the different products they have in their cart  
   resources :products, :only => [:show] do
    resources :line_items, :only => [:create, :update, :destroy]
   end
   
  resources :users, :only => [:show] do
   resources :reviews, :only => [:new, :create, :edit, :update, :show, :destroy, :index]
  end
   
 resources :products, :only => [:show] do
  resources :reviews, :only => [:index, :show]
 end
 
 resources :reviews
 
end
