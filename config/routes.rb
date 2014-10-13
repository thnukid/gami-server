Rails.application.routes.draw do


  get '/', to: redirect('/debug')

  namespace :api do
    post 'events', to: 'events#create'
    get 'users/', to: 'api#index'
    get 'users/:username', to: 'api#user'
    get 'users/:username/badges', to: 'api#badges'
    get 'users/:username/aliases', to: 'api#aliases'
 end

  namespace :debug do
    get '/', to: 'debug#events'
    get '/alias', to: 'debug#alias'
    get '/user', to: 'debug#users'
    get '/badge', to: 'debug#badge'
  end

end
