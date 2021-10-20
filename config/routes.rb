Rails.application.routes.draw do
  devise_for :users
  resources :service_types
  resources :parcels
  resources :addresses
  resources :users
  root to: 'parcels#index'
  get '/search', to: 'search#index'
  get '/admin', to: 'users#admin'
  get '/view_report', to: 'users#view_report'
  post '/create_user', to: 'users#create_user'
  patch '/update_user', to: 'users#update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
