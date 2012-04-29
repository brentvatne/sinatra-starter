require 'spec_helper'
require_relative '../../app/models/user'
require_relative '../../app/models/token_pair'

module StarterApp
  describe "user" do
    let(:omniauth_params) {
      { 'info' => { 'email' => 'brentvatne@gmail.com' },
        'credentials' => token_pair_attrs }
    }

    let(:token_pair_attrs) {
      { 'token'         => "123",
        'refresh_token' => "abcd123",
        'expires_at'    => 98765 }
    }

    let(:user) { User.create(:email => 'brentvatne@gmail.com') }

    it "can be found by email" do
      user
      User.first(:email => 'brentvatne@gmail.com').should == user
    end

    it "has a tokenpair" do
      user.should respond_to(:token_pair)
      puts user.id

      token = TokenPair.create(token_pair_attrs)
      puts token.id
      user.token_pair = token
      user.token_pair.should == token
      user.token_pair.access_token.should == "123"
      user.token_pair.refresh_token.should == "abcd123"
      user.token_pair.expires_at.should == 98765

      user.token_pair.user.should == user
    end

    describe "find_or_create_from_omniauth" do
      it "should create a user if it does not exist" do
        User.count.should == 0
        User.find_or_create_from_omniauth(omniauth_params)
        User.count.should == 1

        new_user = User.all.first
        new_user.email.should == "brentvatne@gmail.com"
        new_user.token_pair.access_token.should == "123"
      end
    end
  end
end
