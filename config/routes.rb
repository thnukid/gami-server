Rails.application.routes.draw do


  get '/', to: redirect('/debug')

  namespace :api do
    post 'events', to: 'events#create'
 end

  namespace :debug do
    get '/', to: 'debug#events'
    get '/alias', to: 'debug#alias'
    get '/user', to: 'debug#users'
    get '/badge', to: 'debug#badge'
  end

end
