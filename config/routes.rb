Rails.application.routes.draw do
  resources :cities do
    resources :attractions, only: [:create]
  end
  resources :attractions, except: [:create]
  resources :user_roadtrips
  resources :roadtrips
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
