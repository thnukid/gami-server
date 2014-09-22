$LOAD_PATH << '../lib'
require 'factory_girl'
require 'gami/gami_rule'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
