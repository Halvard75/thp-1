Rails.application.routes.draw do
  resources :users
  root   'static_pages#home'
  get    '/secret',    to: 'users#secret'
  get    '/home',   to: 'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
