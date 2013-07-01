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
  
  validates :category_id, :uniqueness => { :scope => [:amount, :date] }
  validates :description, :uniqueness => true
  
  belongs_to :user
  belongs_to :category

  def category_name
    Category.find(self.category_id)
  end
  
  # def self.all_cached
  #   Rails.cache.fetch('each_trans') do
  #     User.first.transactions
  #   end
  # end
  
  def check_year(year)
    year < 2011 ? (year += 2000) : year
  end

  def self.import(file, user)
    CSV.foreach(file.path, :headers => true) do |row|
      category = row["Master Category"]
      location = row["Location"]

      date = row["Date"].split("/")
      new_date = Date.new(check_year(date[2].to_i), date[0].to_i, date[1].to_i)
      
      description = row["Description"]
      amount = row["Amount"].gsub(/[$]/,"").to_f

      if category.nil?
        cat = Category.where(:name => 'Uncategorized Payments').first_or_create
      else
        cat = Category.where(:name => category).first_or_create
      end

      Transaction.create(date: new_date,
       amount: amount,
       location: location,
       category_id: cat.id,
       user_id: user.id,
       description: description)
    end
  end

end
