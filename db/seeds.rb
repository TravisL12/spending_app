require 'csv'

User.create(:first_name => 'Travis', :last_name => 'Lawrence', :username => 'travisl12', :email => 'travis.lawrence12@gmail.com', :password => 'travman')

CSV.foreach("Workbook1.csv", :headers => true) do |row|
  # Existing data CSV
  category = row["Category"]
  date = row["date"].split("-")
  new_date = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
  description = row["Description"]
  amount = row["Amount"].to_f

  p Transaction.create(amount: amount,
                      trans_category: category,
                      date: new_date,
                      description: description,
                      deposit: false,
                      user_id: 1)
end

  # # New CSV download input
  # category = row["Master Category"]
  # date = row["Date"].split("/")
  # new_date = Date.new(date[2].to_i, date[0].to_i, date[1].to_i)
  # description = row["Description"]
  # amount = row["Amount"].gsub(/[$]/,"").to_f
  # Transaction.create(amount: amount, category: category, date: new_date, description: description)

Transaction.all.each do |transaction|
  Category.create(:name => transaction.trans_category)
end
