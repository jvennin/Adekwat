Rails.application.routes.draw do
  get 'pois/index'
#  get 'itineraries/index'
  get 'profiles/index'
  get "new_profile", to: "profiles#new", as: :new_profile
  # get 'profiles/show'
  devise_for :users
  root to: 'pages#home'

  resources :itineraries, only: [:create, :show]
  resources :profiles, only: [:index, :new, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




