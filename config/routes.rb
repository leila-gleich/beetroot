Rails.application.routes.draw do
  get 'route/index'

  get 'route/show'

  get 'route/update'

  resources :routes
  resources :airlines
  resources :airports
  root 'welcome#index'
end
