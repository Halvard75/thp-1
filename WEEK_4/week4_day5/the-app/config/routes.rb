Rails.application.routes.draw do

  resources :moussaillons do
    resources :gossips
  end
  resources :gossips do
    resources :comments
  end

  resources :gossips
  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'gossips#index'
end
