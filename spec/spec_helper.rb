require 'rubygems'
require 'bundler/setup'

require "mocha_standalone"
require "bourne"

require 'digest_email'

RSpec.configure do |config|
  config.mock_with :mocha
end
