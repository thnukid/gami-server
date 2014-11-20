$LOAD_PATH << '../lib'
require 'factory_girl'
require_relative "../app/lib/gami/gami.rb"
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
