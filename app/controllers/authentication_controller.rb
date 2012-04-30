require_relative '../app'

module StarterApp
  class App < Sinatra::Application

    # Should deal with an edge case:
    # If the user does not have a refresh token, and no refresh
    # token was given, should redirect to auth with force
    #
    # The problem is I need to get the url from Omniauth and modify
    # it to include approval_prompt=force, and here I should update it
    # (this last bit, updating refresh token, will require some more
    # code on the user in the find or create from omniauth method)
    get '/auth/:provider/callback' do
      user          = User.find_or_create_from_omniauth(omniauth_params)
      session[:uid] = user.email

      omniauth_params.inspect
      # redirect to('/some_signed_in_path')
    end

    get '/auth/failure' do
      content_type 'text/plain'
      "Sorry, something has gone wrong with the authentication process!"
    end

    # Logs the user out by reseting the session token information. Does not
    # delete their token key from the database.
    get '/sign_out' do
      session[:uid]  = nil
      flash[:notice] = "You have been signed out! See you again soon."
      redirect to('/')
    end

    # A condition that can be added to Sinatra app class methods, as follows:
    # get '/', :authenticates => true { .. }
    set(:authenticates) do |required|
      condition { authenticate if required }
    end

    private

    # Instantiates the API client and makes it available to the local thread,
    # or initiates the authroization process if the user is not already
    # authorized
    def authenticate
      if user_logged_in?
        Thread.current['uid'] = session[:uid]
      else
        unless authentication_in_progress?
          redirect '/auth/google_oauth2', 303
        end
      end
    end

    def user_logged_in?
      !!session[:uid]
    end

    # Returns TokenPair instance from the session or returns nil
    def session_token_pair
      if user = User.first(:email => session[:uid])
        user.token_pair
      end
    end

    # Private: Examines the path to determine if authorization is taking place
    #
    # Returns true if authorization is in progress, or false otherwise
    def authentication_in_progress?
      request.path_info =~ /^\/oauth/
    end

    # Private: Returns the Omniauth parameters hash
    def omniauth_params
     request.env['omniauth.auth'].to_hash
    end
  end
end
