Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :news do
      resources :comments do
        resources :interactions
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
