Rails.application.routes.draw do
  
  resources :users

  post '/auth/login', to: 'authentication#authenticate'

  post '/signup', to: 'users#create'

  get '/posts', to: 'posts#index'
  post '/posts', to: 'posts#create'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  get '/providers/:id/schedule', to: 'providers#schedule'
  get '/providers/:id/appointments', to: 'providers#appointments'

  get '/patients/:id', to: 'patients#show'
  get '/patients/:id/appointments', to: 'patients#appointments'
  
  patch '/timeslots/:id', to: 'timeslots#update'

  post '/appointments', to: 'appointments#create'
  delete '/appointments/:id', to: 'appointments#destroy'
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
