Rails.application.routes.draw do
  resources :appoitments do 
  resources :patients
end 
 
 resources :appoitments do 
  resources :doctors
end

  resources :doctors
    resources :patients

  root 'appoitments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
