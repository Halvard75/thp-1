Rails.application.routes.draw do
  resources :plannings do
  resources :classes 
end
  resources :plannings do
  resources :students 
end


    resources :classes
  resources :students

resources :home
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
