Rails.application.routes.draw do
  get 'pois/index'
#  get 'itineraries/index'
  get 'profiles/index'
  get "new_profile", to: "profiles#new", as: :new_profile
  devise_for :users
  root to: 'pages#home'

  resources :itineraries, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




