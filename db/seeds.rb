require 'csv'

User.create(:first_name => 'Travis', 
            :last_name => 'Lawrence', 
            :username => 'travisl12', 
            :email => 'travis.lawrence12@gmail.com', 
            :password => 'travman',
            :password_confirmation => 'travman')

CSV.foreach("Workbook1.csv", :headers => true) do |row|
  category = row["Category"]
  date = row["date"].split("-")
  new_date = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
  description = row["Description"]
  amount = row["Amount"].to_f
   
  if category.nil?
    cat = Category.where(:name => 'Uncategorized Payments').first_or_create
  else
    cat = Category.where(:name => category).first_or_create
  end

  Transaction.create(amount: amount,
                      date: new_date,
                      description: description,
                      deposit: false,
                      user_id: 1,
                      category_id: cat.id)

end