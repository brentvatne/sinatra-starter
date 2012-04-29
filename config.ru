APP_ENV = 'production'

require './app/bootstrap'
require './config/api_credentials'
require 'omniauth'
require 'omniauth-google-oauth2'

use Rack::Session::Cookie

use OmniAuth::Builder do
  scope = 'https://www.googleapis.com/auth/userinfo.email '\
          'https://www.googleapis.com/auth/userinfo.profile'

  provider :google_oauth2,
           StarterApp::GAPI_CLIENT_ID,
           StarterApp::GAPI_CLIENT_SECRET,
           { :scope  => scope,
             :access => 'offline',
             :approval_prompt => '' }
end

run StarterApp::App.new
