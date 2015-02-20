Sutler::Engine.routes.draw do

  devise_for :users, class_name: "Sutler::User", module: :devise, controllers: { sessions: 'sutler/sessions' }

  root 'resources#root'

  match '/uploads' => 'uploads#create', via: [:put, :patch, :post]
  get '/uploads/:id/:file_name' => 'uploads#show'
  delete '/uploads/:id/:file_name' => 'uploads#destroy'

  get '/:resource' => 'resources#index', as: 'resources'
  get '/:resource/new' => 'resources#new', as: 'new_resource'
  post '/:resource' => 'resources#create'
  get '/:resource/:id/edit' => 'resources#edit', as: 'edit_resource'
  match '/:resource/:id/edit' => 'resources#update', via: [:patch, :put]
  delete '/:resource/:id' => 'resources#destroy', as: 'resource'

end
