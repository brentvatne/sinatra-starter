require_relative "../../config/data_mapper"
require 'ostruct'

module StarterApp

  # It is considered a "TokenPair" because there are two tokens: the access token
  # and the refresh token. The access token has a relatively short life to protect
  # against it getting stolen, and the refresh token allows us to grab
  # another access token if the authorization has expired.
  class TokenPair
    include DataMapper::Resource

    belongs_to :user, :required => false

    property :id,            Serial
    property :refresh_token, String
    property :access_token,  String
    property :expires_at,    Integer

    def initialize(attrs)
      if attrs.kind_of?(Hash)
        new_object               = OpenStruct.new
        new_object.refresh_token = attrs[:refresh_token] || attrs['refresh_token']
        new_object.access_token  = attrs[:access_token]  || attrs['token']
        new_object.expires_at    = attrs[:expires_at]    || attrs['expires_at']
        attrs = new_object
      end
      update_token!(attrs)
    end

    # Only set the refresh token once.
    def update_token!(object)
      self.refresh_token = object.refresh_token unless object.refresh_token.nil?
      self.access_token  = object.access_token
      self.expires_at    = object.expires_at
    end

    def to_hash
      { :refresh_token => refresh_token,
        :access_token  => access_token,
        :expires_at    => Time.at(expires_at) }
    end
  end
end
