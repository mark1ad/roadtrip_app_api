Rails.application.routes.draw do
  resources :attractions
  resources :cities
  resources :user_roadtrips
  resources :roadtrips
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
