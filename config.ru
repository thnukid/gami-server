# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :size => 1 }
end

require 'sidekiq/web'
map '/sidekiq' do
  use Rack::Auth::Basic, "Yoo0! Protected Area" do |username, password|
    username == Rails.application.secrets.sidekiq_user && password == Rails.application.secrets.sidekiq_pass
  end

  run Sidekiq::Web
end
