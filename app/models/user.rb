class User < ActiveRecord::Base
  attr_accessible :email, 
                  :first_name, 
                  :last_name, 
                  :username, 
                  :password, 
                  :password_confirmation

  has_many :transactions

  def has_facebook?
    accounts.where(provider: 'facebook').any?
  end

  def has_twitter?
    accounts.where(provider: 'twitter').any?
  end

  def has_foursquare?
    accounts.where(provider: 'foursquare').any?
  end

end
