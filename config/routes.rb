Rails.application.routes.draw do
  root 'start_page#index'

  get '/result' => 'start_page#result', :as => 'result'
end
