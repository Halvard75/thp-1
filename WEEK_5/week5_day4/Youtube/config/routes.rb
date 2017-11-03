Rails.application.routes.draw do
  resources :videos
  resources :categories
  resources :users
  
  resources :videos do
    resources :categories end

  resources :videos do
    resources :users end 

    root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
