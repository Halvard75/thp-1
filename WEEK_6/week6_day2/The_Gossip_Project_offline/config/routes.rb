Rails.application.routes.draw do
  resources :gossips
  devise_for :moussaillons
  get 'home/index'

  root to: "home#index"
  resources :moussaillons do
    resources :gossips
  end

end
