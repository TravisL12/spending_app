class ChangeTransCategoryName < ActiveRecord::Migration
  def change
  	rename_column :transactions, :category, :trans_category
  end
end
