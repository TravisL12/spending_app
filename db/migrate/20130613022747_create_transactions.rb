class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :category
      t.string :description
      t.string :location
      t.decimal :amount
      t.integer :user_id
      
      t.timestamps
    end
  end
end
