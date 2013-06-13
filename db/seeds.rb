require 'csv'

CSV.foreach("All_Payment_Methods061213.csv", :headers => true) do |row|
  
  category = row["Master Category"]
  date = row["Date"].split("/")
  new_date = Date.new(date[2].to_i, date[0].to_i, date[1].to_i)
  description = row["Description"]
  amount = row["Amount"].gsub(/[$]/,"").to_f
  Transaction.create(amount: amount, category: category, date: new_date, description: description)

end

# Master Category,
# Subcategory,
# Date,
# Location,
# Payee,
# Description,
# Payment Method,
# Amount,
