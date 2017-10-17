Rails.application.routes.draw do

  resources :airlines
  resources :airports
  resources :routes
  
  root 'welcome#index'
end
