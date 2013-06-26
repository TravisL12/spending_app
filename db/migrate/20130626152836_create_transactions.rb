class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.string :location
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :deposit, :default => false
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
