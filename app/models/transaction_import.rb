require 'roo'

class TransactionImport

  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  
end
