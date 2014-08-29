Rails.application.routes.draw do

  namespace :api do
   post 'events', to: 'events#create'
 end

end
