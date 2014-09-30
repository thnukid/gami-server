Rails.application.routes.draw do


  get '/', to: redirect('/debug')

  namespace :api do
    post 'events', to: 'events#create'
 end

  namespace :debug do
    get '/', to: 'debug#events'
    get '/a', to: 'debug#alias'
    get '/u', to: 'debug#users'
  end

end
