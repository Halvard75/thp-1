Rails.application.routes.draw do
  resources :assemblies do
  resources :parts end

   resources :parts do
  resources :assemblies end

  root 'parts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
