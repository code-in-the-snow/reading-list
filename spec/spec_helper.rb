require 'byebug'
require 'rspec'
require 'capybara/rspec'

require_relative '../server'

set :environment, :test
set :database, :test

Capybara.app = Sinatra::Application
