Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
  root to: 'pages#home'
end
