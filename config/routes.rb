Rails.application.routes.draw do
  resources :trays
  resources :sheds
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'       , as: 'signup'
  get 'login' , to: 'sessions#new'    , as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  get 'pages/:id' => 'pages#show'

  root 'pages#index'
end
