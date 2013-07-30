class User < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :username,
                  :email,
                  :password,
                  :password_confirmation

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :username,   :uniqueness => true

  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                         :on => :create }
  validates :password, :presence => true, :on => :create

  has_secure_password
  has_many :authentications
  has_many :transactions
end
