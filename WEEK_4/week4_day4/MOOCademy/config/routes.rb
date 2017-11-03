Rails.application.routes.draw do
 root 'cours#index' 
 resources :cours do
  	resources :lessons
  end
end
