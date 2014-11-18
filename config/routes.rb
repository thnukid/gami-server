Rails.application.routes.draw do


  get '/', to: redirect('/debug')

  namespace :api do
    post 'events', to: 'events#create'
    resources :users, param: :name do
      resources :badges
      resources :aliases
    end
 end

  namespace :debug do
    get '/', to: 'debug#events'
    get '/alias', to: 'debug#alias'
    get '/user', to: 'debug#users'
    get '/badge', to: 'debug#badge'
    get '/fact', to: 'debug#fact'
  end

end
