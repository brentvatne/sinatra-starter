require 'spec_helper'
require_relative '../../app/models/token_pair'
require_relative '../../app/models/user'

module StarterApp
  describe "token_pair" do
    let(:attrs) {
      { 'token'         => "123",
        'refresh_token' => "abcd123",
        'expires_at'    => 98765 }
    }

    it "should not require a user" do
      token = TokenPair.create(attrs)
      token.should be_valid
    end

    it "should get a token pair by the id" do
      token = TokenPair.create(attrs)
      TokenPair.get(token.id).should == token
    end
  end
end
