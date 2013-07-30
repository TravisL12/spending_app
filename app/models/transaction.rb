require 'csv'

class Transaction < ActiveRecord::Base
  attr_accessible :amount,
  :category,
  :date,
  :description,
  :location,
  :user_id,
  :category_id,
  :deposit

  validates :user_id, :uniqueness => { :scope => [:category_id, :amount, :date] }
  validates :description, :uniqueness => { :scope => :user_id }

  belongs_to :user
  belongs_to :category

  def category_name
    Category.find(self.category_id)
  end

end
