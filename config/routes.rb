Rails.application.routes.draw do
  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
    resources :roadtrips, only: [:create, :destroy]
  end
  resources :roadtrips, except: [:create] do
    resources :cities, only: [:create]
  end
  resources :cities, except: [:create] do
    resources :attractions, only: [:create, :destroy]
  end
  resources :attractions, except: [:create]
  resources :user_roadtrips, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
