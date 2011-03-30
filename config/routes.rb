Mfp::Application.routes.draw do
  resources :reports
  resources :contacts
  resources :search
  resources :admin

  root :to => "dashboard#index"
end
