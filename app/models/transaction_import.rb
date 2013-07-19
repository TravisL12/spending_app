
class TransactionImport

  #The non-database functionality of Active Record is extracted out into Active Model. 
  #This allows you to cleanly add validations and other features to tableless models.
  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def initialize(attributes = {})
    #this creates an attr_accessible for each attribute of the Action Dispatch object passed in (this object is the value of the "file" key of the hash passed in to initialize)
    attributes.each { |name, value| send("#{name}=", value) }
  end
end
