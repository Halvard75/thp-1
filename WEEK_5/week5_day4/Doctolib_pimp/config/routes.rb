Rails.application.routes.draw do

  resources :cities do
    resources :patients
end 

  resources :cities do
    resources :doctors
end 

  resources :cities do
    resources :appoitments
end 

  resources :appoitments do 
  resources :patients
end 
 
 resources :appoitments do 
  resources :doctors
end

 resources :specialties do 
  resources :doctors
end

 resources :doctors do 
  resources :specialties
end



  resources :doctors
    resources :patients
      resources :cities
      	resources :appoitments
      	  resources :specialties



  root 'appoitments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
