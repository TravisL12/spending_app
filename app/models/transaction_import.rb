
class TransactionImport

  #The non-database functionality of Active Record is extracted out into Active Model. 
  #This allows you to cleanly add validations and other features to tableless models.
  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def initialize(attributes = {})
    #this creates an attr_accessible for each attribute of the Action Dispatch object (which is the value of the "file" key of the hash passed in)
    #we do this so we can read the original filename later (to determine the filetype for Roo & error handling)
    attributes.each { |name, value| send("#{name}=", value) }
  end
end
