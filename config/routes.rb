Rails.application.routes.draw do
  resources :users do
    resources :roadtrips, only: [:create, :destroy]
  end
  resources :roadtrips, except: [:create]
  resources :cities do
    resources :attractions, only: [:create, :destroy]
  end
  resources :attractions, except: [:create]
  resources :user_roadtrips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
