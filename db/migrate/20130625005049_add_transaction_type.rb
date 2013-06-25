class AddTransactionType < ActiveRecord::Migration
  def change
  	add_column :transactions, :deposit , :boolean, :default => false
  end
end
