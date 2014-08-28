Rails.application.routes.draw do

 scope '/api' do
   match 'event', to: 'events#create', via: [:post]
 end

end
