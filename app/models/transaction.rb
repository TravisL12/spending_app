class Transaction < ActiveRecord::Base
  attr_accessible :amount, :category, :date, :description, :location

  belongs_to :user
end
