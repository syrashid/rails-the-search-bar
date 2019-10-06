Rails.application.routes.draw do
  devise_for :users
  resources :cocktails, only: [:index]
  root to: 'cocktails#index'
end
