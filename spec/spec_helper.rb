ENV["RAILS_ENV"] ||= "test"

require 'byebug'
require 'rspec'
require 'capybara/rspec'
require "capybara/poltergeist"
require "database_cleaner"
require "shoulda-matchers"
require 'valid-attribute'
require 'factory-girl'
require 'launchy'

require_relative '../server'

set :environment, :test
set :database, :test

Capybara.app = Sinatra::Application

#################### stuff added for poltergeist & database cleaner
#require File.expand_path("../../config/environment", __FILE__)

Capybara.default_selector = :css
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,
                                    window_size: [1920, 1080],
                                    phantomjs_logger: nil)
end
Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    # set the default
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
