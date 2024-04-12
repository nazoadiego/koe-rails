Rails.application.routes.draw do
  resources :cards do
    post '/:id/schedule', to: 'cards#schedule'
  end
  resources :decks do
    get '/:id/review', to: 'decks#review'
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
