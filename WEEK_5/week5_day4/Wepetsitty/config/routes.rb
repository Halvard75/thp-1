Rails.application.routes.draw do
  resources :strolls do 
  resources :dogs end
    resources :strolls do 
  resources :dogsitters end

    resources :dogs
  resources :dogsitters

  root 'strolls#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
