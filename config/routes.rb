Rails.application.routes.draw do
  resources :cards
  resources :decks
  get '/decks/:id/review', to: 'decks#review'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
