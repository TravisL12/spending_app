require 'roo'

class TransactionImport

  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {}, user = nil)
    attributes.each { |name, value| send("#{name}=", value) }
    @user = User.find(user.id) if user != nil
  end
  
  def persisted?
    false
  end

  def save
    if imported_transactions.map(&:valid?).all?
      imported_transactions.each(&:save!)
      true
    else
      imported_transactions.each_with_index do |transaction, index|
        transaction.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end
  
  def imported_transactions
    @imported_transactions ||= load_imported_transactions
  end

  def load_imported_transactions
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      category = row["Master Category"]
      location = row["Location"]
      description = row["Description"]
      amount = row["Amount"].gsub(/[$]/,"").to_f unless row["Amount"].class == Float
      
      if row["Date"].length < 10
        date = Date.strptime(row["Date"],'%m/%d/%y')
      else
        date = Date.strptime(row["Date"],'%m/%d/%Y')
      end

      if category.nil?
        cat = Category.where(:name => 'Uncategorized Payments').first_or_create
      else
        cat = Category.where(:name => category).first_or_create
      end

      transaction = Transaction.where("user_id = ? AND category_id = ? AND amount = ? AND date = ?",
        @user.id, cat.id, amount, date).first || Transaction.new(date: date, amount: amount, location: location,
                                                   category_id: cat.id, user_id: @user.id, description: description)

      transaction
    end
  end


  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}. Please import '.csv', '.xls', or '.xlsx' file types only."
    end
  end

end
