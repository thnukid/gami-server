Rails.application.routes.draw do

  get '/', to: redirect('/debug')

  namespace :api do
    post 'events', to: 'events#create'
 end

  namespace :debug do
    get '/', to: 'debug#events'
    get '/u', to: 'debug#users'
  end

end
