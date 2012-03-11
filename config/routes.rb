Mfp::Application.routes.draw do


  # Deal with User sessions
  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"

  # Primary routes
  resources :sessions
  resources :analyses
  resources :reports
  resources :contacts
  resources :search
  resources :calls_for_service

  # Administrative routes
  resources :admin
  
  # Default route
  root :to => "dashboard#index"
end
