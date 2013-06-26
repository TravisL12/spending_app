class Transaction < ActiveRecord::Base
  attr_accessible :amount, :category, :date, :description, :location, :user_id, :deposit

  belongs_to :user
  has_one :category
end
