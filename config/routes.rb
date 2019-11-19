Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :cocktails, only: [:index]
  root to: 'pages#home'
end
