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

## What I would like to see added

- Some kind of form builder
- Asset compilation & concatenation for production

## What I don't like about it

- I'd prefer not to use the name `Controller` for my separate pieces of
  the Sinatra app, but I can't think of any better name for it right
  now.

## Use it

1. Install dependencies: `bundle install`. Ensure you have a sqlite
	 library installed that is compatible with DataMapper.
2. Replace all occurrences of StarterApp with your app name.
3. Build your thing.

## Run the tests

Uses Rspec, so just do `rspec spec`
*Tested with: Ruby 1.9.3p0*
