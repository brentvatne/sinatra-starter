APP_ENV = 'test'

require 'rack/test'
require 'rspec'
require 'sinatra/base'
require_relative '../config/data_mapper'

RSpec.configure do |config|
  config.before(:each) { DataMapper.auto_migrate! }
  config.mock_with :mocha
end
