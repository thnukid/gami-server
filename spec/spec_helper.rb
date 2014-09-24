$LOAD_PATH << '../lib'
require 'factory_girl'
require 'gami/gami_badge'
require 'gami/gami_rule'
require 'gami/gami_game'
require 'gami/gami_engine'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
