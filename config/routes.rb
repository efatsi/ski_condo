SkiCondo::Application.routes.draw do
  resources :users, :only => [:new, :create, :index, :show]
  resources :days, :only => :index

  post '/days/:id/visit' => 'visits#create',  :as => 'visit'
  delete '/visits/:id'  => 'visits#destroy', :as => 'unvisit'
  put '/visits/:id' => 'visits#update', :as => 'update_visit'

  get '/login'  => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :sessions, :only => :create

  root 'days#index'
end
