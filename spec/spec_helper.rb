$LOAD_PATH << '../lib'
require 'factory_girl'
require_relative "../app/lib/gami/gami.rb"
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
