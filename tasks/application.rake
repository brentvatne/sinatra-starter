desc 'Start the application'

task :server do
  system "ruby -e \"require './app/bootstrap'; StarterApp::App.run!\""
end

namespace :server do
  desc 'Automatically reloads all source files on each request, much slower'
  task :auto_reload do
    system "bundle exec shotgun config.ru -p 5555"
  end
end
