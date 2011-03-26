Mfp::Application.routes.draw do
  resources :contacts

  root :to => "dashboard#index"
end
