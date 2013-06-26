class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, :uniqueness => true

  has_many :transactions
end