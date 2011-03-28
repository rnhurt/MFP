Mfp::Application.routes.draw do
  resources :reports
  resources :contacts

  root :to => "dashboard#index"
end
