# Sinatra Starter App

## What is it

A Sinatra app bootstrap that might be useful for quick apps, maybe for
hackathons. It includes several ruby gems and javascript libraries I
enjoy working with. What it does for you:

- OmniAuth integration
- SASS and CoffeeScript compilation
- Sane directory structure
- A barebones User model, persisted with DataMapper. Includes a
  TokenPair model as well, to handle refresh tokens with Google OAuth2
- JavaScript libraries: Backbone, Underscore, jQuery, Jasmine, Moments
- Some simple style defaults: CSS3 Github-style buttons by Nicolas
  Gallagher, and the 'Sea Farer' typography theme by Russ Maschmeyer
- Rack-flash-enabled flash messages (was surprised to find that this is
  not a default in Sinatra)
- Rails style view helpers (content_for, form builder, etc) with the
  padrino-helpers gem.

## What I would like to see added

- Asset compilation & concatenation for production
- Headless JavaScript spec runner from the command line

## What I don't like about it

- I'd prefer not to use the name `Controller` for my separate pieces of
  the Sinatra app, but I can't think of any better name for it right
  now.

## Use it

1. Install dependencies: `bundle install`. Ensure you have a sqlite
	 library installed that is compatible with DataMapper.
2. Replace all occurrences of StarterApp with your app name.
3. Start the app with `rake server` and navigate to `localhost:4567`
4. Build your thing. You can use `rake server:auto_reload` to start
   up Rack with Shotgun. This will automatically reload the app on each HTTP 
   request.

## Run the tests

- Ruby: Uses Rspec, so just do `rspec spec`
- JavaScript: Uses Jasmine, start the server up and navigate to
`localhost:4567/test-js/SpecRunner.html`

*Tested with: Ruby 1.9.3p0*
