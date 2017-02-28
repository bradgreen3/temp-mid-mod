Rails.application.routes.draw do

  root to: "links#index"

  resources :links, only: [:index, :edit, :update]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/api/v1/links/search_all' => 'api/v1/links#search'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create, :update, :index]
    end
  end
end
