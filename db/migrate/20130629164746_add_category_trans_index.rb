class AddCategoryTransIndex < ActiveRecord::Migration
  def change
    add_index :transactions, :category_id, :name => "category_id_index"
    add_index :transactions, :user_id, :name => "user_id_index"
  end
end
