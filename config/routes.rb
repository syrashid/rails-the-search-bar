Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cocktails, only: [:index, :show, :update, :create ]
    end
  end
end
