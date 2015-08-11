require 'byebug'
require 'rspec'
require 'capybara/rspec'
require "capybara/poltergeist"
require "database_cleaner"
require 'valid_attribute'
require 'launchy'

require_relative '../server.rb'

set :environment, :test
set :database, :test

Capybara.app = Sinatra::Application
ActiveRecord::Base.logger.level = 1

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
