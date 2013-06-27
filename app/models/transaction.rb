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

  def category_name
    Category.find(self.category_id)
  end
  
  def self.all_cached
    Rails.cache.fetch('each_trans') do 
      User.first.transactions
    end
  end

end
