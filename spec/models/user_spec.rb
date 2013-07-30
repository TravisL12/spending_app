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

    describe 'with duplicate username' do
      it 'will not create user' do
        User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav@trav.com',
          :password => 'password',
          :password_confirmation => 'password')

        user2 = User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav2@trav.com',
          :password => 'password',
          :password_confirmation => 'password')

        expect(user2.invalid?).to be_true
      end
    end

    describe 'with duplicate email' do
      it 'will not create user' do
        User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav@trav.com',
          :password => 'password',
          :password_confirmation => 'password')

        user2 = User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis2',
          :email => 'trav@trav.com',
          :password => 'password',
          :password_confirmation => 'password')

        expect(user2.invalid?).to be_true
      end
    end

    describe 'with invalid email' do
      it 'will not create user' do
        user = User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav',
          :password => 'password',
          :password_confirmation => 'password')

        expect(user.invalid?).to be_true
      end
    end

    describe 'with passwords not matching' do
      it 'will not create user' do
        user = User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav@trav.com',
          :password => 'yup',
          :password_confirmation => 'nope')

        expect(user.invalid?).to be_true
      end
    end

    describe 'with no first name' do
      it 'will not create user' do
        user = User.create( :first_name => '',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav@trav.com',
          :password => 'yup',
          :password_confirmation => 'nope')

        expect(user.invalid?).to be_true
      end
    end

    describe 'with no last name' do
      it 'will not create user' do
        user = User.create( :first_name => 'Travis',
          :last_name => '',
          :username => 'travis',
          :email => 'trav@trav.com',
          :password => 'yup',
          :password_confirmation => 'nope')

        expect(user.invalid?).to be_true
      end
    end

    describe 'with no password' do
      it 'will not create user' do
        user = User.create( :first_name => 'Travis',
          :last_name => 'Lawrence',
          :username => 'travis',
          :email => 'trav@trav.com',
          :password => '',
          :password_confirmation => 'nope')

        expect(user.invalid?).to be_true
      end
    end
  end
end

