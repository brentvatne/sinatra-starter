desc 'Start the application'

task :server do
  system "bundle exec rackup -p 4567"
end

namespace :server do
  desc 'Automatically reloads all source files on each request, much slower'
  task :auto_reload do
    system "bundle exec shotgun config.ru -p 4567"
  end
end
