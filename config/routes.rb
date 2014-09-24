Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

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
