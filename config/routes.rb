Rails.application.routes.draw do
  resources :run_types
  resources :reports
  resources :runs
  resources :flocks
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'       , as: 'signup'
  get 'login' , to: 'sessions#new'    , as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  get 'pages/:id' => 'pages#show'

  root 'pages#index'
end
