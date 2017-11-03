Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :pins
  end
  resources :pins do
    resources :comments
  end

  resouces :comments
end
