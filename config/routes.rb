Mfp::Application.routes.draw do
  # Deal with User sessions
  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"
  resources :sessions

  # Primary routes
  resources :reports
  resources :contacts
  resources :search
  resources :admin

  # Administrative routes

  
  # Default route
  root :to => "dashboard#index"
end
