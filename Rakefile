require "sinatra/activerecord/rake"  # from tv shows sinatra
require "rspec/core/rake_task"

namespace :db do
  task :load_config do
    require "./server"
  end
end

RSpec::Core::RakeTask.new(:spec)

# require 'rspec/core/rake_task'
#
# RSpec::Core::RakeTask.new :spec do |task|
#   task.pattern = Dir['spec/**/*_spec.rb']
# end
#
# task :default => ['spec']
