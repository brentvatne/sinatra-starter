require_relative "../../config/data_mapper"

module StarterApp
  class User
    include DataMapper::Resource

    property :id,    Serial
    property :email, String, :unique => true

    def self.find_or_create_from_omniauth(params)
      first_or_create(:email => params['info']['email'])
    end
  end
end
