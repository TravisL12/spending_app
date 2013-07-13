class User < ActiveRecord::Base
  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :username,
                  :password,
                  :password_confirmation

  validates :username, :uniqueness => true
  validates :email,
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                         :on => :create }
  validates :password, :presence => true, :on => :create

  has_secure_password
  has_many :authentications
  has_many :transactions
end
