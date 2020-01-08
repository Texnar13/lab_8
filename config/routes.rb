Rails.application.routes.draw do
  #resources :users
  root 'start_page#index'
  get 'start_page/index'

  get 'result' => 'start_page#result', :as => 'result'


  get '/login' => 'sessions#registration'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get '/users' => 'users#index'
  post '/users' => 'users#create'

  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  post '/users/:id/update' => 'users#update'
  get '/users/:id/destroy' => 'users#destroy'

end
