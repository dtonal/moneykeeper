Rails.application.routes.draw do
  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  resources :costs

  root 'costs#index'

  namespace :api do
    resources :costs, :sessions, :weekstats, :monthstats, :budgets
  end


end
