Rails.application.routes.draw do
  get 'transactions/new'
  get 'stationeries/new'
  get 'sessions/new'

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/borrow', to: 'transactions#new'
  post '/borrow', to: 'transactions#create'
  post '/return', to: 'transactions#return'
  get '/history', to: 'transactions#full_history'

  resources :users, :stationeries
end