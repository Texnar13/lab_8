Rails.application.routes.draw do
  root 'start_page#index'


  get 'result' => 'start_page#result'
  #resources :my_result_page
end
