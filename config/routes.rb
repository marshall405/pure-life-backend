Rails.application.routes.draw do
  
  resources :users

  post '/auth/login', to: 'authentication#authenticate'

  post '/signup', to: 'users#create'

  get '/posts', to: 'posts#index'
  post '/posts', to: 'posts#create'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  get '/providers/:id/schedule', to: 'providers#schedule'
  
  patch '/timeslots/:id', to: 'timeslots#update'
   

  get '/appointments', to: 'appointments#appointments'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
