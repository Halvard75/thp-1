Rails.application.routes.draw do

  resources :sessions

  resources :events do
    resources :users
  end

  resources :users do
    resources :events
  end

  root   'sessions#new'
  get    '/home',   to: 'events#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :events do
    post 'attend', on: :member
    post 'unattend', on: :member
  end
end
