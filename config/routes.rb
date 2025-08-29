Rails.application.routes.draw do
  # get 'search/index'
  resources :quotes
  resources :categories
  resources :philosophers
  resources :users
  # get 'about/index'
  # get 'home/index'

  root 'home#index'
  get '/about', to: 'about#index'
  get 'search', to: 'search#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # routes for the admin, standard user landing pages
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  # route for the page where logged in users can view the quotes they added
  get '/your-quotes', to: 'home#uquotes'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
