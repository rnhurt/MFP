Mfp::Application.routes.draw do

  # Deal with User sessions
  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"
  resources :sessions

  # Primary routes
  resources :analyses
  resources :contacts
  resources :search
  resources :calls_for_service
  resources :admin

  # Administrative routes

  
  # Default route
  root :to => "dashboard#index"
end
