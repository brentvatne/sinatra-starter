require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Dir["tasks/*.rake"].sort.each { |ext| load ext }
