Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams' => 'teams#index'
  get '/teams/new' => 'teams#new'
  post '/teams' => 'teams#create'
  get '/teams/:id' => 'teams#show'
  get '/teams/:id/edit' => 'teams#edit'
  patch '/teams/:id' => 'teams#update'
  delete '/teams/:id' => 'teams#destroy'

end
