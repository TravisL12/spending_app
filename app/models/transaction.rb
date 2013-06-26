class Transaction < ActiveRecord::Base
  attr_accessible :amount,
                  :trans_category,
                  :date,
                  :description,
                  :location,
                  :user_id,
                  :category_id,
                  :deposit

  belongs_to :user
  belongs_to :category
end
