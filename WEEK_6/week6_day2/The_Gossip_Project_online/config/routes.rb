Rails.application.routes.draw do
  resources :gossips
  devise_for :users

  resources :users do
    resources :gossips
  end

  get 'home/index'

  root to: "home#index"
end
