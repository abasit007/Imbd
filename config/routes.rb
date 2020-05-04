Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies
  # get :search, to: "movies#search"
  get '/search' => 'movies#search', as: 'search'
  root 'movies#index'
end
