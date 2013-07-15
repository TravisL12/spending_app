class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :email
  belongs_to :user
end
