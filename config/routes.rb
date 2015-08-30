Rails.application.routes.draw do
  resources :users
  get 'pages/:id' => 'pages#show'

  root 'pages#index'
end
