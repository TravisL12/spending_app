require 'spec_helper'

describe 'User' do
  context 'when created' do
    describe 'with unique inputs' do
      it 'will create user' do
        user = User.create( :first_name => 'Travis',
                  :last_name => 'Lawrence',
                  :username => 'travis',
                  :email => 'trav@trav.com',
                  :password => 'password',
                  :password_confirmation => 'password')

        expect(user.valid?).to be_true
      end
    end
  end
end
