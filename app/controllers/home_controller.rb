module StarterApp
  class App < Sinatra::Application
    get '/' do
      erb :home
    end
  end
end
