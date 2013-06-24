class Deposit < Transaction
  attr_accessible :amount, :category, :date, :description, :location, :user_id

  belongs_to :user
end
