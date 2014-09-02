Rails.application.routes.draw do

  get '/', to: redirect('/api')

  namespace :api do
    get '/', to: 'events#index'
    post 'events', to: 'events#create'
 end

end
